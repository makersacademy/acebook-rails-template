require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe "GET /posts/:post_id/comments" do
    it "responds with 200 with correct post" do
      get :index, params: { post_id: 1}
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /posts/:post_id/create" do
    it "responds with 200" do
      post :create, params: { post_id: 1, comment: {content: "Testing comment" } }
      expect(response).to redirect_to("/")
    end

    it "creates a comment" do
      post :create, params: { post_id: 1, comment: { content: "Testing comment" } }
      expect(Comment.find_by(content: "Testing comment")).to be
    end
  end  

end
