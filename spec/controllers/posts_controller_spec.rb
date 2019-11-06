require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  before(:each) do
    @user = FactoryBot.create(:user)
    @request.session[:user_id] = @user.id
  end

  describe "GET /new " do
    it "responds with 200" do
      get :new
      expect(@user).to be_valid
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      post :create, params: { post: { content: "Hello, world!" } }
      expect(response).to redirect_to(posts_url)
    end

    it "creates a post" do
      session["user_id"] = @user.id
      post :create, params: { post: { content: "Hello, world!" } }
      expect(Post.find_by(content: "Hello, world!")).to be
    end
  end

  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT /" do
    it "edits a post" do
      post :create, params: { post: { content: "Hello, world!" } }
      postid = Post.find_by(content: "Hello, world!").id
      put :update, params: { id: postid, post: { content: "Goodbye, world!" } }
      expect(Post.find_by(content: "Goodbye, world!")).to be
    end
  end

  describe "DELETE /" do
    it "deletes a post" do
      post :create, params: { post: { content: "Hello, world!" } }
      expect(Post.find_by(content: "Hello, world!")).to be
      postid = Post.find_by(content: "Hello, world!").id
      delete :destroy, params: { id: postid }
      expect(Post.find_by(content: "Hello, world!")).not_to be
    end
  end
end
