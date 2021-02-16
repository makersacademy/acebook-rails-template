require 'rails_helper'

RSpec.describe User, type: :model do
  it "can create new user" do
    user = User.new(username: "user123", password: "password")
    expect(user).to be_valid
  end

  it "new user isn't valid without password" do
    user = User.new
    user.username = "user123"
    expect(user).not_to be_valid
  end

  it "new user isn't valid without username" do
    user = User.new
    user.password = "password"
    expect(user).not_to be_valid
  end

  it "new user isn't valid if username is already in use" do
    user = User.new(username: "testuser1", password: "hello")
    expect(user).not_to be_valid
  end
end
