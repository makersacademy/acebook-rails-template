require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before(:each) do
    @user1 = User.create(name: 'matt', email:'mdwareing@gmail.com', password: 'test12345')
    @user2 = User.create(name: 'ben', email:'ben@gmail.com', password: 'test12345')
    @relationship = Relationship.new(follower_id: @user1.id, followed_id: @user2.id)
  end

  it 'should be valid' do
    expect(@relationship).to be_valid
  end

  it 'requires a follower id' do
    @relationship.follower_id = nil
    expect(@relationship).not_to be_valid
  end

  it 'requires a followed id' do
    @relationship.followed_id = nil
    expect(@relationship).not_to be_valid
  end
end
