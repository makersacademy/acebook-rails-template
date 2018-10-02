require "rails_helper"

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user1 = User.new(name: "Bob", email: "b@b.com", password: "123456", password_confirmation: "123456")
    expect(user1).to be_valid
  end

  it "can return a user name" do
    user2 = User.new(name: "Bob", email: "b@b.com", password: "123456", password_confirmation: "123456")
    expect(user2.name).to eq("Bob")
  end

  it "is not valid without a name" do
    user = User.new(name: nil)
    expect(user).to_not be_valid
  end
end
