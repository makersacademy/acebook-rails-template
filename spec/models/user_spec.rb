require 'rails_helper'

RSpec.describe User, type: :model do
  it "User is valid with the correct attributes" do
    user = User.create(fname: 'jon', lname: 'doe', email: 'john.doe@example.com', password: 'password')
    expect(user).to be_valid
  end

  it "User is not valid with the wrong attributes" do
    user = User.create(fname: nil, lname: nil, email: nil, password: nil)
    expect(user).to_not be_valid
  end
end
