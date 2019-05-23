require 'rails_helper'

RSpec.describe User, type: :model do

  it 'should be a valid user' do
    @user = User.new(first_name: "John", last_name: "Doe", email: "john@doe.com", password: "john123456")
    assert @user.valid?
  end

  context 'fields should be filled in' do

    it 'first name should be present' do
      @user = User.new(first_name: "", last_name: "Doe", email: "john@doe.com", password: "john123456")
      assert !@user.valid?
    end

    it 'last name should be present' do
      @user = User.new(first_name: "John", last_name: "", email: "john@doe.com", password: "john123456")
      assert !@user.valid?
    end

    it 'email address should be present' do
      @user = User.new(first_name: "John", last_name: "Doe", email: "", password: "john123456")
      assert !@user.valid?
    end

    it 'password should be present' do
      @user = User.new(first_name: "John", last_name: "Doe", email: "john@doe.com", password: "")
      assert !@user.valid?
    end
  end

  context 'password conforms to valid format' do

    it 'should be between six and ten characters' do
      @user = User.new(first_name: "John", last_name: "Doe", email: "john@doe.com", password: "john12")
      assert @user.valid?
      @user2 = User.new(first_name: "John", last_name: "Doe", email: "john@doe.com", password: "john123456")
      assert @user2.valid?
    end

    it 'should not be less than six or more than ten characters' do
      @user = User.new(first_name: "John", last_name: "Doe", email: "john@doe.com", password: "john")
      assert !@user.valid?
      @user2 = User.new(first_name: "John", last_name: "Doe", email: "john@doe.com", password: "john12456789")
      assert !@user2.valid?
    end
  end

  context 'email address conforms to valid format' do

    it 'should be of the format name@site.domain' do
      @user = User.new(first_name: "John", last_name: "Doe", email: "john@doe.com", password: "john123456")
      valid_addresses = %w[user@example.com Falumpf123@swizzle.blorb Grok_1@omple.io]
      valid_addresses.each do |valid_address|
        @user.email = valid_address
        assert @user.valid?, "#{valid_address.inspect} should be valid"
      end
    end

    it 'should not judge an invalid email to be valid' do
      @user = User.new(first_name: "John", last_name: "Doe", email: "john@doe.com", password: "john123456")
      invalid_addresses = %w[ajnfakf128437 184856276402 asjbfbkaf.ajnff@lkasnf ajnfanfaf@aknjf,com ldaksfmdf£aksnf.com]
      invalid_addresses.each do |invalid_address|
        @user.email = invalid_address
        assert !@user.valid?, "#{invalid_address.inspect} should not be valid"
      end
    end
  end

end
