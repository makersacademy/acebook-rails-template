require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(User.new(id: 1))
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

  describe "DELETE /destroy" do
    it "deletes a post" do
      @user = User.create(email: "a@a.com", password: "abc123", id: 2)
      @post = Post.create(message: "Hello, world!", id: 100, user_id: @user.id)
      expect {
        delete :destroy, params: { id: @post.id }
      }.to change(Post, :count).by(-1)
    end
  end

  describe "EDIT /update" do
    it "edits a post" do
      @user = User.create(email: "a@a.com", password: "abc123", id: 2)
      @post = Post.create(message: "Hello, world!", id: 100, user_id: @user.id)
      @post = Post.update(message: "Have a great day!", id: 100, user_id: @user.id)
      expect(Post.find_by(message: "Have a great day!")).to be
    end
  end

end
