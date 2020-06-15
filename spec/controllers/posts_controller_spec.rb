# frozen_string_literal: true

require 'rails_helper'
require 'sessions_helper'
include SessionsHelper

RSpec.describe PostsController, type: :controller do
  before(:each) do
    @user = User.create(email: 'beefy@iamalegend.com', password: 'somepassword')
    session[:user_id] = @user.id
  end

  describe 'GET /new ' do
    it 'responds with 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /' do
    it 'redirects' do
      post :create, params: { post: { message: 'Hello, world!' } }
      expect(response).to redirect_to(posts_url)
    end

    it 'creates a post' do
      post :create, params: { post: { message: 'Hello, world!' } }
      expect(Post.find_by(message: 'Hello, world!')).to be
    end

    it 'correctly stores the user_id when passed one' do
      post :create, params: { post: { message: 'Hello, world!' } }

      expect(Post.find_by(message: 'Hello, world!').user_id).to eq(@user.id)
    end
  end

  describe 'GET /' do
    it 'responds with 200' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE /" do
    it "correctly deletes a post" do
      post :create, params: { post: { message: "Hello, world!" } }
      @post = Post.find_by(message: "Hello, world!")
      delete :destroy, params: { id: @post.id }
      expect(Post.find_by(message: "Hello, world!")).to_not be
    end

    it "doesn't delete the post if the post is owned by a different user" do
      post :create, params: { post: { message: "Hello, world!" } }
      @post = Post.find_by(message: "Hello, world!")

      @user2 = User.create({email: "iamlegend@makers.com", password: "helloroku"})
      log_out
      log_in(@user2)

      delete :destroy, params: { id: @post.id }
      expect(Post.find_by(message: "Hello, world!")).to be
    end

    it "displays a helpful error message if you try to delete someone else's post" do
      post :create, params: { post: { message: "This is my post!" } }
      @post = Post.find_by(message: "This is my post!")

      @user2 = User.create({email: "mynewuser@users.com", password: "goroku666"})
      log_out
      log_in(@user2)

      delete :destroy, params: { id: @post.id }
      expect(Post.find_by(message: "This is my post!")).to be
      expect(flash[:no_delete]).to have_content('You can only delete posts that you created. Classic Roku.')
    end

    it "does not display an error message on successful deletion" do
      post :create, params: { post: { message: "Wednesday Hump Day" } }
      @post = Post.find_by(message: "Wednesday Hump Day")

      delete :destroy, params: { id: @post.id }
      expect(Post.find_by(message: "Wednesday Hump Day")).to_not be
      expect(flash[:no_delete]).to_not have_content('You can only delete posts that you created. Classic Roku.')
    end
  end

  describe "GET /edit" do

    it "successfully edits a post" do
      post :create, params: { post: { message: "Hello acebook!" } }
      @post = Post.find_by(message: "Hello acebook!")

      post :update, params: { id: @post.id, post: { message: "testing 1 2 3" } }
      expect(Post.find_by(message: "testing 1 2 3")).to be
      expect(Post.find_by(message: "Hello acebook!")).to_not be
    end

    it "redirects if post is over 10 mins old" do
      post :create, params: { post: { message: "Hello, world!" } }
      @post = Post.find_by(message: "Hello, world!")
      travel(601)
      get :edit, params: { id: @post.id }
      expect(response).to redirect_to(posts_url)
    end
    it "sets flash failure message if post is over 10 mins old" do
      post :create, params: { post: { message: "Hello, world!" } }
      @post = Post.find_by(message: "Hello, world!")
      travel(601)
      get :edit, params: { id: @post.id }
      expect(flash[:edit_timeout_failure]).to eq 'Sorry, you can only edit this post in the first 10 minutes after creation'
    end
    it "does not redirect if post is under 10 mins old" do
      post :create, params: { post: { message: "Hello, world!" } }
      @post = Post.find_by(message: "Hello, world!")
      travel(599)
      get :edit, params: { id: @post.id }
      expect(response).to_not redirect_to(posts_url)
    end
    it "does not set flash message if post is under 10 mins old" do
      post :create, params: { post: { message: "Hello, world!" } }
      @post = Post.find_by(message: "Hello, world!")
      travel(599)
      get :edit, params: { id: @post.id }
      expect(flash[:edit_timeout_failure]).to eq nil
    end

    it "disallows edit on someone else's post" do
      post :create, params: { post: { message: "Hello, world!" } }
      @post = Post.find_by(message: "Hello, world!")

      @user2 = User.create({email: "iamlegend@makers.com", password: "helloroku"})
      log_out
      log_in(@user2)

      get :edit, params: { id: @post.id }
      expect(response).to redirect_to(posts_url)
    end

    it "gives an error message on edit of someone else's post" do
      post :create, params: { post: { message: "Hello, world!" } }
      @post = Post.find_by(message: "Hello, world!")

      @user2 = User.create({email: "iamlegend@makers.com", password: "helloroku"})
      log_out
      log_in(@user2)

      get :edit, params: { id: @post.id }
      expect(flash[:no_edit]).to eq("You can only edit posts that you created. Classic Roku.")
    end

    it "does not display an error on successful edit" do
      post :create, params: { post: { message: "Hello acebook!" } }
      @post = Post.find_by(message: "Hello acebook!")

      get :edit, params: { id: @post.id }
      expect(flash[:no_edit]).to_not eq("You can only edit posts that you created. Classic Roku.")

      post :update, params: { id: @post.id, post: { message: "testing 1 2 3" } }
      expect(flash[:no_edit]).to_not eq("You can only edit posts that you created. Classic Roku.")
    end
  end
end
