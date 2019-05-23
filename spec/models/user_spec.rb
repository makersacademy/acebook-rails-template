require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: "Test", email: "test@test.com", password: "1234")}
  describe "name" do
    it "checks if the name is present" do
      expect(user.name).to eq("Test")
    end

    it "checks that the user has given a valid name" do
      expect(User.create(name: "", email: "test@test.com", password: "1234").valid?).to be(false)
    end

    it "checks the length of the name is valid" do
      expect(User.create(name: "ABCDEFGHIJKLMNOPQRSTUVWXYZ", email: "test@test.com", password: "1234").valid?).to be(false)
    end
  end

  describe "email" do
    it "checks if the email is present" do
      expect(user.email).to eq("test@test.com")
    end

    it "checks that the user has given an email address" do
      expect(User.create(name: "Test", email: "", password: "1234").valid?).to be(false)
    end

    it "checks that the length of the email is valid" do
      expect(User.create(name: "Test", email: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", password: "1234").valid?).to be(false)
    end

    it "checks that the email is not already in the database" do
      new_user = user.dup
      user.save
      expect(new_user.valid?).to be(false) 
    end
  end

  describe "password" do
    it "checks if the password is present" do
      expect(user.password).to eq("1234")
    end

    it "checks that the user has entered a password" do
      expect(User.create(name: "Test", email: "test@test.com", password: "").valid?).to be(false)
    end

    it "checks that the password is a valid length" do
      expect(User.create(name: "Test", email: "test@test.com", password: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").valid?).to be(false)
    end
  end
end
