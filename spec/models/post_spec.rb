require 'rails_helper'

RSpec.describe Post, type: :model do

  before do
    @user = User.create(first_name: 'Dave', last_name: 'Whatever', email: 'dave@123.com', password: 123)
    @post = Post.create(message: 'hello world', user_id: @user.id)
  end

  it 'Create a new Post object' do
    expect(subject).to be_a Post
  end

  it 'Is linked to user_id' do
    expect(@post.user_id).to eq @user.id
  end

end
