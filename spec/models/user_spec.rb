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





end
