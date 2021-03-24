require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = User.new(name: "Lizardo", email: "lizard@example.com", password: "123secure", password_confirmation: "123secure")
    @user.save
  end

  subject { @user }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:email) }
  it { is_expected.to respond_to(:password_digest)}
  it { is_expected.to respond_to(:password) }
  it { is_expected.to respond_to(:password_confirmation) }
  it { is_expected.to respond_to(:authenticate) }

  it { is_expected.to be_valid }

  describe "when name field is not present" do

    before { @user.name = "" }
    it { is_expected.not_to be_valid }

  end

  describe "when email field is not present" do

    before { @user.email = "" }
    it { is_expected.not_to be_valid }

  end

  describe "when name is too long" do

    before { @user.name = "a" * 26 }
    it { is_expected.not_to be_valid }

  end

  describe "when email format is valid" do

    it 'should be valid' do
      emails = ["lizard@lizardcity.COM", "LI_ZA_RD@iam.alizard.org", "bernie.sanders@notalizard.jp", "l+iz@liz.cn"]
      emails.each do |valid_email|
        @user.email = valid_email
        expect(@user).to be_valid
      end
    end

  end

  describe "when email format is not valid" do

    it 'should not be valid' do
      emails = ["lizard_lizardcity.COM", "LI_ZA_RD@iam-alizard-org", "bernie.sanders.notalizard.jp", "liz@liz+.cn"]
      emails.each do |invalid_email|
        @user.email = invalid_email
        expect(@user).not_to be_valid
      end
    end
  end

  describe "when email is a duplicate" do
    before do
      @user_with_same_email = @user.dup
      @user_with_same_email.email = @user.email.upcase
      @user_with_same_email.save
    end
    it "should not be valid" do
      expect(@user_with_same_email).not_to be_valid
    end

  end

  describe "when password is not given" do
    before do
      @user.password = @user.password_confirmation = ""
    end
    it "should not be valid" do
      expect(@user).not_to be_valid
    end
  end

  describe "when password does not match" do
    before do
      @user.password_confirmation = "notamatch"
    end
    it "should not be valid" do
      expect(@user).not_to be_valid
    end
  end

  describe "when password is nil" do
    before do
      @user.password_confirmation = nil
    end
    it "should not be valid" do
      expect(@user).not_to be_valid
    end
  end

  describe "authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email)}

    describe "with a valid password" do
      it "should be valid" do
        expect(@user).to eq(found_user.authenticate(@user.password))
      end
    end

    describe "with an invalid password" do
      let(:invalid_password_user) { found_user.authenticate("invalid")}
      it "should not be valid" do
        expect(@user).not_to eq(invalid_password_user)
        expect(invalid_password_user).to be false
      end
    end

    describe "should be minimum 6 characters" do
      before { @user.password = @user.password_confirmation = "a" * 5 }
      it "should not be valid" do
        expect(@user).not_to be_valid
      end
    end

    describe "should be maximum 10 characters" do
      before { @user.password = @user.password_confirmation = "a" * 11 }
      it "should not be valid" do
        expect(@user).not_to be_valid
      end
    end

  end
end
