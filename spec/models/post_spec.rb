require 'rails_helper'


RSpec.describe Post, type: :model do

#factory bot

  context '#sortedbymostrecent' do
    it "returns posts in reverse chronological order" do
      user = create(:user)
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
end
