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
      user = create_user
      post :create, params: { post: { message: "Hello, world!", user_id: user.id } }
      expect(response).to redirect_to(posts_url)
    end

    it "creates a post" do
      user = create_user
      post :create, params: { post: { message: "Hello, world!", user_id: user.id } }
      expect(Post.find_by(message: "Hello, world!")).to be
    end
  end

  describe "GET /" do
    it "responds with 200" do
      user = create_user
      session[:user_id] = user.id 
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
