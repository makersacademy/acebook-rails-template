require 'rails_helper'

RSpec.describe User, type: :model do
  it "is not valid without password" do
    user = User.new
    user.username = "Lotty"
    expect(user).to_not be_valid
  end

  it "is not valid without username" do
    user = User.new
    user.password= "password123"
    expect(user).to_not be_valid
  end

  it "is not valid with a repeated username" do
    user = User.new
    user.username = "Charlotte"
    user.password= "password123"
    expect(user).to_not be_valid
  end

  it "is valid with valid attributes" do
    user = User.new
    user.username = "Lotty"
    user.password = "password123"
    user.full_name = "Charlotte Cole"
    user.email = "charlotte@gmail.com"
    user.mobile = "0000000000"
    user.address = "London, UK"
    user.url = "ttpsjknkjnkjn"
    expect(user).to be_valid
  end
end


