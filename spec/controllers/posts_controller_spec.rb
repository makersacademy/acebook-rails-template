# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET /new ' do
    it 'responds with 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /' do
    it 'responds with 200' do
      post :create, params: { post: { message: 'Hello, world!' } }
      expect(response).to redirect_to(posts_url)
    end

    it 'creates a post' do
      post :create, params: { post: { message: 'Hello, world!' } }
      expect(Post.find_by(message: 'Hello, world!').message).to eq('Hello, world!')
    end
  end

  describe 'GET /' do
    it 'responds with 200' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'CRUD' do

    it 'creates a post' do
      post :create, params: { post: { message: 'Hello, world!' } }
      post = Post.find_by(message: 'Hello, world!').message
      expect(post).to eq('Hello, world!')
    end

    it 'edit a post' do
      post :create, params: { post: { message: 'Hello, world!' } }
      post = Post.find_by(message: 'Hello, world!')
      patch :update, params: { id: post.id, post: {message: 'Hello, people!'} }
      post_check = Post.find(post.id)
      expect(post_check.id).to eq(post.id)
      expect(post_check.message).to eq('Hello, people!')
    end

    it 'deletes a post' do
      post :create, params: { post: { message: 'Hello, world!' } }
      post = Post.find_by(message: 'Hello, world!')
      p post.message
      delete :destroy, params: { id: post.id }
      # post_check = Post.find(post.id)
      # p post_check
      # p Post.all
      all_post = Post.all
      expect(post.message).not_to be("Hello, world!")
    end


  end
end
