require 'rails_helper'

RSpec.describe Post, type: :model do

  it 'User post input not to be nil' do
    user = User.create(fname: 'jon', lname: 'doe', email: 'john.doe@example.com', password: 'password')
    post = Post.create(message: 'This is a new message!', user_id: user.id)
    expect(post).to be_valid
  end

  it 'User post input to be nil' do
    post = Post.create(message: nil)
    expect(post).to_not be_valid
  end

end
