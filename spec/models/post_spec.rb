require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:dbl_user) { double :user, id: 1 }
  describe "#owner" do
    it "returns true when called with its owner" do
      post = Post.create(message: "test", user_id: 1)
      expect(post.owner?(dbl_user)).to be_truthy
    end
    it "return false when called with a different owner" do
      post = Post.create(message: "test", user_id: 2)
      expect(post.owner?(dbl_user)).to be_falsey
    end
  end
  describe "#find_like" do
    it "returns true when called with its owner" do
      post = Post.create(message: "test", user_id: 1)
      like = post.likes.create(user_id: 1)
      expect(post.find_like(dbl_user)).to eq(like)
    end
    it "return false when called with a different owner" do
      post = Post.create(message: "test", user_id: 1)
      post.likes.create(user_id: 2)
      expect(post.find_like(dbl_user)).to be_falsey
    end
  end
end
