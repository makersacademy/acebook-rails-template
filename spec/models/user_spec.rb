require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = User.new(full_name: "My Name", handle: "My Handle", email: "ab@cd.com", password:"123456")
  end

  describe "validity of sign-up details" do
    it "is valid" do
      expect(@user.valid?).to eq(true)
    end

    it "full name should not be blank" do
      @user.full_name = " "
      expect(@user.valid?).not_to eq(true)
    end

    it "handle should not be blank" do
      @user.handle = " "
      expect(@user.valid?).not_to eq(true)
    end
    
    it "email should not be blank" do
      @user.email = " "
      expect(@user.valid?).not_to eq(true)
    end
    
    it "password should not be blank" do
      @user.password = " "
      expect(@user.valid?).not_to eq(true)
    end

  end

end
