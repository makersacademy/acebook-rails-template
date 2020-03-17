require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to be }
 
  it 'checks a post has a message' do
    post = Post.create(message: "hey", created_at: Time.now)
    expect(post.message).to eq("hey")
  end

  it 'checks a post has a date' do
    date = Time.now
    post = Post.create(message: "hey", created_at: date)
    expect(post.created_at).to eq(date)
  end

  it 'checks post is associated to a user' do
    user = User.new
    post = Post.create(message: "hey", user: user)
    expect(post.user).to eq(user)
  end
end
