require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = User.create({username: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar"})
  end

  describe '.create' do
    it 'creates a valid user' do
      assert @user.valid?
    end

    it 'name should be present' do
      @user.username = '      '
      assert !@user.valid?
    end

    it 'name should be present' do
      @user.email = '      '
      assert !@user.valid?
    end

    it "name should not be too long" do
      @user.username = "a" * 51
      assert !@user.valid?
    end

    it "email should not be too long" do
      @user.email = "a" * 244 + "@example.com"
      assert !@user.valid?
    end

    it "email validation should accept valid addresses" do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                           first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
        @user.email = valid_address
        assert @user.valid?, "#{valid_address.inspect} should be valid"
      end
    end

    it "email validation should reject invalid addresses" do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                             foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        @user.email = invalid_address
        assert !@user.valid?, "#{invalid_address.inspect} should be invalid"
      end
    end

    it "email addresses should be unique" do
      duplicate_user = @user.dup
      duplicate_user.email = @user.email.upcase
      @user.save
      assert !duplicate_user.valid?
    end

    it "email addresses should be saved as lower-case" do
      mixed_case_email = "Foo@ExAMPle.CoM"
      @user.email = mixed_case_email
      @user.save
      assert_equal mixed_case_email.downcase, @user.reload.email
    end
  end

  describe 'password' do

    it "password should be present (nonblank)" do
      @user.password = @user.password_confirmation = " " * 6
      assert !@user.valid?
    end
  
    it "password should have a minimum length" do
      @user.password = @user.password_confirmation = "a" * 5
      assert !@user.valid?
    end
  end
end

