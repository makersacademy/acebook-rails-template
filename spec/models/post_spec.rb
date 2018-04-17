require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:dbl_user) { double :user, id: 1 }
  describe "#owner?" do
    it "returns true when called with its owner" do
      post = Post.create(message: "test", user_id: 1)
      expect(post.owner?(dbl_user)).to be_truthy
    end
    it "return false when called with a different owner" do
      post = Post.create(message: "test", user_id: 2)
      expect(post.owner?(dbl_user)).to be_falsey
    end
  end
  describe "#self.timesort" do
    it "returns a time-sorted list of posts" do
      post1 = Post.create(message: "test", user_id: 1)
      post2 = Post.create(message: "test2", user_id: 2)
      expect(Post.time_sort_all[0].message).to eq(post2.message)
    end
  end
end
