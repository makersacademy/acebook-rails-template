require 'rails_helper'

RSpec.describe User, type: :model do
  
  before(:each) do
    @user = User.new(full_name: "My Name", handle: "My Handle", email: "ab@cd.com", password:"123456")
  end

  describe "validity of sign-up details" do
    it "is valid" do
      expect(@user.valid?).to eq(true)
    end
  end

end
