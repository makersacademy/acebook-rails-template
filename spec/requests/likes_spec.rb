require 'rails_helper'

RSpec.describe "Likes", type: :request do
  describe "POST /post/1/likes" do
    it "works! (now write some real specs)" do
      post post_likes_path(Post.first.id)
      expect(response).to have_http_status(302)
    end
  end
end
