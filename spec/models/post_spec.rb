require 'rails_helper'

RSpec.describe Post, type: :model do


  context '#sortedbymostrecent' do
    it "returns posts in reverse chronological order" do
      add_posts_to_database
      expect(Post.sortedbymostrecent).to eq(Post.all.reverse)
    end
  end

  context '#linebreak' do
    it "returns a multi-line message on new lines" do
      post1 = Post.create(message: "hello\r\nworld")
      expect(post1.linebreak).to eq(["hello", "world"])
    end
  end
end
