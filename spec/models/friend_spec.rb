require 'rails_helper'

RSpec.describe Friend, type: :model do
  it "is not valid without requester" do
    friend = Friend.new
    friend.receiver_id = 1
    expect(friend).to_not be_valid
  end

  it "is not valid without reciever" do
    friend = Friend.new
    friend.requester_id = 1
    expect(friend).to_not be_valid
  end

  it "is valid with valid attributes" do
    friend = Friend.new
    friend.receiver_id = 1
    friend.requester_id = 1
    expect(friend).to be_valid
  end
end
