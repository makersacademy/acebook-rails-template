# frozen_string_literal: true

require 'rails_helper'
require './app/models/post'


RSpec.describe Post, type: :model do

  before(:each) do
    @user = User.new(id: 1, email: 'user1@email.com', encrypted_password: 'password', first_name: 'user_name', last_name: 'user_surname')
    @post = Post.new(id: 1, message: 'let there be light!', user_id: 2, postimage: nil)
  end

  it 'can be upvoted' do   
    @post.liked_by @user
    expect(@post.get_likes.size).to eq(1)
  end
  
  it 'can be downvoted' do   
    @post.disliked_by @user
    expect(@post.get_dislikes.size).to eq(1)
  end
end
