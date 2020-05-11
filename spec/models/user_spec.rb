require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'valid user' do
    it "standard user should be valid" do
      user = User.new(name: "Gina", email: "gina@example.com", password_digest: "12345")

      expect(user).to be_valid
    end
  end

  describe 'valid user name' do
    it "standard user name should be valid" do
      user = User.new(name: "Gina")

      expect(user).to be_valid
    end

    it "no user name should be invalid" do
      user = User.new(name: nil)

      expect(user).to_not be_valid
    end
  end

  
  
end
