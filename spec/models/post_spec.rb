require 'rails_helper'

RSpec.describe Post, type: :model do
  it "is a valid with  valid attributes" do
    expect(Post.new).to be_valid
  end 
  it "is not valid without a message" do
    post = Post.new(message: nil)
    expect(post).to_not be_valid
  end
  it "is not valid without a created_at" do 
    expect(Post.new).to be_valid
  end
  it "is not valid without a updated_at" do 
    expect(Post.new).to be_valid
  end
end
