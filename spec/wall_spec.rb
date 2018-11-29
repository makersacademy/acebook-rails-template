require 'rails_helper'

describe 'Wall' do

  let(:wall) {Wall.new(1)}

  describe 'User Walls' do
    it 'has a user id' do
      expect(wall.id).to eq(1)
    end

    it 'has an empty array of posts at initialize' do
      expect(wall.posts).to eq []
    end

    it 'loads a post made on the wall' do
      user = create(:user)
      post = create(:post)
      wall.add_posts
      expect(wall.posts).to eq [post.message]
    end

    it 'loads posts made on a wall' do
      user = create(:user)
      post1 = create(:post)
      post2 = create(:post)
      wall.add_posts
      expect(wall.posts.length).to eq 2
    end
  end
end
