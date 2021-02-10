require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe "GET /timeline" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /posts/create" do
    it "responds with 200" do
      post :create, params: { post: { content: "Hello, world!" } }
      expect(response).to redirect_to("/")
    end

    it "creates a post" do
      post :create, params: { post: { user_id: "1", content: "Hello, world!" } }
      expect(Post.find_by(content: "Hello, world!")).to be
    end

    it "creates a retweet" do
      post :create, params: { post: { user_id: "1", content: "I'm sharing this!", original_post_id: 1 } }
      retweet = Post.find_by(content: "I'm sharing this!")
      expect(retweet).to be
      expect(retweet.original_post.content).to eq "Hello World"
    end
  end

  describe "GET /post/:id" do
    it "responds with 200" do
      get :show, params: { id: 1 }
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT/posts/:id" do
    it "responds with 200" do
      put :update, params: { id: 1 }
      expect(response).to redirect_to("/")
    end 
  
    it "likes should increase by 1" do
      put :update, params: { id: 1 }
      post = Post.find(1)
      expect(post.likes).to equal 1
    end
  end

end
