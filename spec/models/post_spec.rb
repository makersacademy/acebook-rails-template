require 'rails_helper'

RSpec.describe Post, type: :model do
  it "create new post" do
    post = Post.new(user_id: 1, content: "Hello")
    expect(post).to be_valid
  end

  it "is not valid without user" do
    post = Post.new(content: "Hello")
    expect(post).not_to be_valid
  end

  it "is not valid without content" do
    post = Post.new(user_id: 1)
    expect(post).not_to be_valid
  end

end
