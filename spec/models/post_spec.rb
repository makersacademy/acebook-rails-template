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

  describe "#like_count_string" do
    it "returns singular string when given a single like" do
      post = Post.create(message: "test", user_id: 1)
      post.likes.create(user_id: 1)
      expect(post.like_count_string).to eq('1 Like')
    end
    it "returns plural string when no likes" do
      post = Post.create(message: "test", user_id: 1)
      expect(post.like_count_string).to eq('0 Likes')
    end
    it "returns plural string when given multiple likes" do
      post = Post.create(message: "test", user_id: 1)
      post.likes.create(user_id: 1)
      post.likes.create(user_id: 2)
      expect(post.like_count_string).to eq('2 Likes')
    end
  end

  describe "#comment_count_string" do
    it "returns singular string when given a single like" do
      post = Post.create(message: "test", user_id: 1)
      post.comments.create(content: "test", post_id: 1, user_id: 1)
      expect(post.comment_count_string).to eq('1 Comment')
    end
    it "returns plural string when no likes" do
      post = Post.create(message: "test", user_id: 1)
      expect(post.comment_count_string).to eq('0 Comments')
    end
    it "returns plural string when given multiple likes" do
      post = Post.create(message: "test", user_id: 1)
      post.comments.create(content: "test", post_id: 1, user_id: 1)
      post.comments.create(content: "test2", post_id: 1, user_id: 1)
      expect(post.comment_count_string).to eq('2 Comments')
    end
  end

  describe "#created_at_timestring" do
    it "returns a formatted string with the time it was created at" do
      allow(Time).to receive(:now).and_return(Time.mktime(0))
      dateString = Time.now.strftime("%a %e %b %H:%M")
      post = Post.create(message: "test", user_id: 1)
      expect(post.created_at_timestring).to eq(dateString)
    end
  end

  describe "#timesort_comments" do
    it "returns a time-sorted array of comments" do
      post = Post.create(message: "test", user_id: 1)
      post.comments.create(content: "test", post_id: 1, user_id: 1)
      post.comments.create(content: "test2", post_id: 1, user_id: 1)
      expect(post.timesort_comments[0].content).to eq("test2")
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
