require 'rails_helper'

RSpec.describe Like, type: :model do
  context "with 2 or more likes" do
    it "tallies them" do
      user = User.create({:email => "example@example.com", :password => "example"})
      post = user.posts.create({:message => "Meow"})
      like = post.likes.create(user_id: user.id)
      expect(post.likes[0]).to eq(like)
    end
  end
end
