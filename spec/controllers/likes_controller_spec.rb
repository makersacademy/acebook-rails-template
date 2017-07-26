require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  describe "POST /" do
    it "responds with 200" do
      test_post = Post.create(message: "test post for likes")
      p test_post
      post :create, params: { like: { post_id: 1 } }
    end
  end
end
