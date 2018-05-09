require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  expected_post = [
    Post.new(
    id: '1',
    message: 'Hello!',
    created_at: "#{Time.now}",
    )
  ]
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

    it "creates a post" do
      post :create, params: { post: { message: "Hello!" } }
      puts expected_post[0].created_at
      expect(Post.find_by(message: "Hello!").created_at.strftime("%m/%d/%Y")).to eq(expected_post[0].created_at.strftime("%m/%d/%Y"))
    end
  end

  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
