require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  let(:user) { create(:user) }

  before(:each) do
    sign_in user
  end

  describe "GET /comments/new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /comments" do
    it "responds with 200" do

      post :create, params: { post: { message: "Excellent post!" } }
      expect(response).to redirect_to(root_path)
    end

    it "creates a post" do

      post :create, params: { post: { message: "Excellent post!" } }
      expect(Comment.find_by(message: "Excellent post!")).to be
    end
  end

end
