require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  # test not required as we are not using /new route
  # describe "GET /new " do
    # it "responds with 200" do
      # get :new
      # expect(response).to have_http_status(200)
    # end
  # end

  describe "POST /" do
    it "redirects to index" do
      post :create, params: { post: { message: "Hello, world!", username: "Jo33" } }
      expect(response).to redirect_to(posts_url)
    end

    it "creates an entry in the database" do
      post :create, params: { post: { message: "Hello, world!", username: "Jo33" } }
      expect(Post.find_by(message: "Hello, world!")).to be
      expect(Post.find_by(username: "Jo33")).to be
    end
  end

  describe "GET /" do
    it "index responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
