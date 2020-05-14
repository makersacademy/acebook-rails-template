require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'valid user:' do
    it "standard user should be valid" do
      user = User.new(name: "Gina", email: "gina@example.com", password: "12345678")
      expect(user).to be_valid
    end
  end

  describe 'valid user name' do
    it "standard user name should be valid" do
      user = User.new(name: "Gina", email: "gina@example.com", password: "12345678")

      expect(user).to be_valid
    end

    it "no user name should be invalid" do
      user = User.new(name: nil, email: "gina@example.com", password: "12345678")
      expect(user).to_not be_valid
    end

    it "user name invalid if already exists" do
      User.create(name: "Gina", email: "gina@example.com", password: "12345678")
      user2 = User.new(name: "Gina", email: "smiley@example.com", password: "12345678")

      expect { user2.save validate: false }.to raise_error(ActiveRecord::RecordNotUnique)
    end
  end

  describe 'valid user email:' do
    it "if no email is entered user is invalid" do
      user = User.new(name: 'Gina', email: nil, password: "12345678")
      expect(user).to_not be_valid
    end 

    it "user email invalid if already exists" do
      User.create(name: "Gina", email: "gina@example.com", password: "123456")
      user2 = User.new(name: "Alexa", email: "gina@example.com", password: "123456")
      expect { user2.save validate: false }.to raise_error(ActiveRecord::RecordNotUnique)
    end

    it "user email needs to  have a valid format" do
      invalid_emails = ["gina.example", '23567b', '@google.com']
      invalid_emails.each do |invalid_email| 
        user = User.new(name: "Gina", email: invalid_email, password: "123456")
        expect(user).to_not be_valid 
      end 
    end 
  end 

  describe 'valid user password:' do
    it "if no password is entered user is invalid" do
      user = User.new(name: "Gina", email: "gina@example.com", password: nil)
      expect(user).to_not be_valid
    end 

    it 'password is encrypted ' do
      password = '123456'
      user = User.create(name: "Gina", email: "gina@example.com", password: password)
      user.reload
      expect(user.password_digest).to_not eq password
    end 
    it 'password is between 6 to 10 characters' do 
      short_password = 'a' * 5
      user = User.create(name: "Gina", email: "gina@example.com", password: short_password)
      expect(user).to_not be_valid
    end
  end
end
