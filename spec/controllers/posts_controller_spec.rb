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

    describe "GET /edit" do
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
    end
  end
end
