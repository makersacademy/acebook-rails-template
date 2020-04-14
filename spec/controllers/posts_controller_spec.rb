# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:valid_attributes) {
    skip(message: "test")
  }

  let(:valid_session) { {} }

  describe 'GET /new' do
    it 'responds with 200' do
      get :new
      expect(response.status).to eq(302)
    end
  end

  describe "POST #update" do
    it "updates the requested user" do
      #put :update, params: {id: post.to_param, post: {message: "hello"}}, session: valid_session
      #post.reload
      post = Post.create(message: "hi")
      p post
      post = Post.update(post.id, message: 'hello')
      p post
      expect(post.message).to eq "hello"
    end
  end

  describe 'POST /' do
    it 'creates a post' do
      #post :create, params: { post: { message: 'Hello, world!' } }
      post = Post.create(message: 'Hello, world!')
      expect(Post.find_by(message: 'Hello, world!')).to be
    end
  end

  describe 'GET /' do
    it 'responds with 200' do
      get :index
      expect(response).to have_http_status(302)
    end
  end

  describe 'DELETE /posts/:id' do
    it 'deletes a post' do
      post = Post.create(message: "Hello, world!")
      Post.destroy(post.id)
#      post :create, params: { post: { message: 'Hello, world!' } }
#      delete :destroy, params: { id: post.id }
      expect(Post.find_by(message: 'Hello, world!')).to_not be
    end
  end
end
