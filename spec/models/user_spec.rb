require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = User.new(name: "Lizardo", email: "lizard@example.com")
  end

  subject { @user }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:email) }  

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

end
