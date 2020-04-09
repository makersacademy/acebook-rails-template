# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:valid_attributes) {
    skip(message: "test")
  }

  let(:valid_session) { {} }


  describe 'GET /new ' do
    it 'responds with 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      post = Post.create(message: "hi")
      get :edit, params: {id: post.to_param}, session: valid_session
      expect(response).to be_success
    end
  end
  describe "POST #update" do
    it "updates the requested user" do
       post = Post.create(message: "hi")
       put :update, params: {id: post.to_param, post: {message: "hello"}}, session: valid_session
       post.reload
       expect(post.message).to eq "hello"
     end
   end


  describe 'POST /' do
    it 'responds with 200' do
      post :create, params: { post: { message: 'Hello, world!' } }
      expect(response).to redirect_to(posts_url)
    end

    it 'creates a post' do
      post :create, params: { post: { message: 'Hello, world!' } }
      expect(Post.find_by(message: 'Hello, world!')).to be
    end
  end

  describe 'GET /' do
    it 'responds with 200' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'DELETE /posts/:id' do
    it 'deletes a post' do
      post :create, params: { post: { message: 'Hello, world!' } }
      post = Post.find_by(message: 'Hello, world!')
      expect(post).to be

      delete :destroy, params: { id: post.id }
      expect(Post.find_by(message: 'Hello, world!')).to_not be
    end
  end
end
