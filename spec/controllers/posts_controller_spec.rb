require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe "GET /timeline" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      post :create, params: { post: { content: "Hello, world!" } }
      expect(response).to redirect_to("/timeline")
    end

    it "creates a post" do
      post :create, params: { post: { user_id: "1", content: "Hello, world!" } }
      expect(Post.find_by(content: "Hello, world!")).to be
    end
  end

  describe "GET /post/:id" do
    it "responds with 200" do
      get :show, params: { id: 1 }
      expect(response).to have_http_status(200)
    end
  end
end
