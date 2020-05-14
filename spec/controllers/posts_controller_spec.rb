require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before do
    user = User.create(name: "Gina", password: "123456", email: "gina@example.com")
    session[:user_id] = user.id
  end
  describe "GET /new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      post :create, params: { post: { message: "Hello, world!" } }
      expect(response).to redirect_to user_path(session[:user_id])
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

  describe "DELETE /" do
    it "deletes a post" do
      post :create, params: { post: { message: "Hello, world!" } }
      found_post = Post.find_by(message: "Hello, world!")
      delete :destroy, params: { id: found_post.id }
      expect(Post.find_by(message: "Hello, world!")).not_to be
    end
  end

  describe "PATCH /" do
    it "updates a post" do
      post :create, params: { post: { message: "Big Turtle" } }
      found_post = Post.find_by(message: "Big Turtle")
      patch :update, params: { id: found_post.id, post: { message: "New Turtle" } }
      expect(Post.find_by(message: "New Turtle")).to be
    end 
  end
end
