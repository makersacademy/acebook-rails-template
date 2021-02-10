require 'rails_helper'

RSpec.describe Post, type: :model do
  it "is not valid without valid user" do
    new_post = Post.new
    new_post.content = "Hello World!"
    expect(new_post).not_to be_valid
  end

  it "is not valid without content" do
    new_post = Post.new
    new_post.user_id = "1"
    expect(new_post).not_to be_valid
  end

  it "is valid with valid attributes" do
    new_post = Post.new
    new_post.user_id = "1"
    new_post.content = "Hello World!"
    expect(new_post).to be_valid
  end

  it "post has zero likes" do
  new_post = Post.new
  expect(new_post.likes).to equal 0
  end

  it " post can have multiple likes" do
    new_post = Post.new
    expect { new_post.increment!(:likes)}.to change { new_post.likes }.by(1)
  end 

  it "can set up a retweet / share" do
    retweet = Post.new()
    retweet.user_id = 1
    retweet.content = "I am sharing this post!"
    retweet.original_post_id = 1 # retweeting post 1
    expect(retweet).to be_valid
    expect(retweet.original_post.content).to eq "Hello World"
  end
end