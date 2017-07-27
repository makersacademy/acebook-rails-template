require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  describe "POST /" do
    it "responds with 200" do
      post :create, params: { like: { post_id: 1 } }
      expect(response).to redirect_to(posts_url)
    end
    it "creates a like" do
      test_post = Post.create(message: "test post for likes")
      post :create, params: { like: { post_id: 1 } }
      expect(Like.find_by(post_id: 1)).to be
    end
  end
end
