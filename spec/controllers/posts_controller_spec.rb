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

  describe "GET /posts" do
    it "sorts newest first" do
      # @post_newest = Post.new(message: "Bye, world!")
     post :create, params: { post: { message: "Hello, world!" } }
     post :create, params: { post: { message: "Bye, world!" } }
     p Post.all
      # p Post.new(message: "Bye, world!")
      # expect(Post.order('created_at desc').all).to be [@post_newest, @post]
    end
  end
end
