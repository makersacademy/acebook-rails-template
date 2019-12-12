require 'rails_helper'


RSpec.describe Post, type: :model do

#factory bot
  let (:user) { create(:user) }

  context '#sortedbymostrecent' do
    it "returns posts in reverse chronological order" do

      post1 = user.posts.create(message: "hello")
      post2 = user.posts.create(message: "world")
      post3 = user.posts.create(message: "Bye")
      expect(Post.sortedbymostrecent).to eq([post3, post2, post1])
    end
  end

  context '#linebreak' do
    it "returns a multi-line message on new lines" do
      post1 = Post.create(message: "hello\r\nworld")
      expect(post1.linebreak).to eq(["hello", "world"])
    end
  end

  context '#update_valid?' do
    it "update is still valid if posted within the last 10 mins" do
      post = user.posts.create(message: "Can you update me")
      expect(post.update_valid?).to be_truthy
    end

    it "cant update after 10 mins" do
      post = user.posts.create(message: "Can you update me")
      allow(post).to receive(:created_at).and_return(Time.now - 650)
      expect(post.update_valid?).to be_falsey
    end

  end
end
