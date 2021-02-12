require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
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
