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
      post = Post.find_by(message: "Hello, world!")
      expect(post.message).to eq "Hello, world!"
    end
  end

  describe "DELETE /" do
    it 'deletes a post' do
      post :create, params: { post: { message: "Hello, world!" } }
      post = Post.find_by(message: "Hello, world!")
      post.destroy
      expect(Post.exists?(post.id)).to be false
    end
  end

  describe "PATCH /" do
    it 'updates a post' do
      post :create, params: { post: { message: "Hello, world!" } }
      post = Post.find_by(message: "Hello, world!")
      post.update(message: "Sup, dudes!")
      expect(post.message).to eq "Sup, dudes!"
    end
  end

  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
