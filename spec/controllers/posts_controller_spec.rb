require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET /new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      post :create, params: { post: { message: "Hello, world!" } }
      expect(response).to redirect_to(posts_url)
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

  describe "DELETE /posts/id" do
    before(:each) do
      user = User.create(name: "Andres", email: "email@email.com", password: "password")
      Post.create(message: 'Please delete me!', user_id: user.id)
    end

    it "responds with 302" do
      delete :destroy, params: { id: 1 }
      expect(response).to redirect_to(posts_url)
      expect(response).to have_http_status(302)
    end
  end
end
