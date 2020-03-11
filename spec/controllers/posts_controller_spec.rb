require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET /new " do
    it "responds with 302 if not signed in" do
      get :new
      expect(response).to have_http_status(302)
    end
  end

  describe "POST /" do
    it "responds with redirect to sign in page" do
      post :create, params: { post: { message: "Hello, world!" } }
      expect(response).to redirect_to("http://test.host/users/sign_in")
    end

    it "creates a post" do
      post :create, params: { post: { message: "Hello, world!" } }
      expect(Post.find_by(message: "Hello, world!")).to be
    end
  end

  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
