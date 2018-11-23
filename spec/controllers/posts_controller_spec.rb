require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET /new " do
    it "responds with 302 if not logged in" do
      get :new
      expect(response).to have_http_status(302)
    end
  end

  describe "POST /" do
    it "redirects to posts url when post is created" do
      user = create(:user)
      sign_in user
      post :create, params: { post: { message: "Hello, world!" } }
      expect(response).to redirect_to(posts_url)
    end

    it "creates a post" do
      user = create(:user)
      sign_in user
      post :create, params: { post: { message: "Hello, world!" } }
      post_id = Post.find_by(message: "Hello, world!").id
      get :show, params: { id: post_id }
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /" do
    it "responds with 302 if not logged in" do
      get :index
      expect(response).to have_http_status(302)
    end
  end

  describe "POST /posts/:id/like" do
    it "creates a like" do
      user = create(:user)
      sign_in user
      post :create, params: { post: { message: "Hello, world!" } }
      post_id = Post.find_by(message: "Hello, world!").id
      post :like, params: { like: true, id: post_id }
      expect(Post.find_by(message: "Hello, world!").likes.size).to be 1
    end

    it "removes a like" do
      user = create(:user)
      sign_in user
      post :create, params: { post: { message: "Hello, world!" } }
      post_id = Post.find_by(message: "Hello, world!").id
      post :like, params: { like: true, id: post_id }
      post :like, params: { like: true, id: post_id }
      expect(Post.find_by(message: "Hello, world!").likes.size).to be 0
    end
  end
end
