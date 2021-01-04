# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  # Add this
  # let(:valid_attributes) do
  #   { post: 'Test post!', message: 'Hello, world!' }
  # end

  let(:user) { FactoryBot.create(:user) }

  describe 'GET /new ' do
    it 'responds with 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /' do
    it 'responds with 200' do
      sign_in(user)
      post :create, params: { post: { message: 'Hello, world!', user_id: user.id } }
      expect(response).to redirect_to(posts_url)
    end
  end

  describe 'GET /' do
    it 'responds with 200' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /posts/:id/edit' do
    it 'responds with 200' do
      sign_in(user)
      post :create, params: { post: { message: 'Hello, world!', user_id: user.id } }
      post = Post.find_by(message: 'Hello, world!')
      get :edit, params: { id: post.id }
      expect(response).to have_http_status(200)
    end
  end

  describe 'PATCH /posts/:id' do
    it 'redirects appropriately' do
      sign_in(user)
      post :create, params: { post: { message: 'Hello, world!', user_id: user.id } }
      post = Post.find_by(message: 'Hello, world!')
      patch :update, params: { id: post.id, post: { message: 'Hello, world!', user_id: user.id } }
      expect(response).to redirect_to(posts_path)
    end

    it 'updates the message' do
      sign_in(user)
      post :create, params: { post: { message: 'Hello, world!', user_id: user.id } }
      post = Post.find_by(message: 'Hello, world!')
      patch :update, params: { id: post.id, post: { message: 'The world is a dark, dark place', user_id: user.id } }
      expect(Post.find(post.id).message).to eq('The world is a dark, dark place')
    end

    it 'displays a flash notice' do
      sign_in(user)
      User.create(id: 2, email: 'testy@testy.com', password: '1234567')
      user2 = User.find_by(email: 'testy@testy.com')
      allow(User).to receive(:find_by).and_return({ user: {id: 2, email: 'testy@testy.com' }})
      post :create, params: { post: { message: 'Hello, world!', user_id: user.id } }
      post = Post.find_by(message: 'Hello, world!')
      patch :update, params: { id: post.id, post: {message: 'The world is a dark, dark place', user_id: user2.id } }
      expect(response).to redirect_to(posts_path)
    end
  end
  describe 'DESTROY' do
    it 'deletes the message' do
      sign_in(user)
      post :create, params: { post: { message: 'Hello, world!', user_id: user.id } }
      post = Post.find_by(message: 'Hello, world!')
      expect { delete :destroy, params: { id: post.id } }.to change { Post.count }.by(-1)
    end

    it 'redirects properly after delete' do
      sign_in(user)
      post :create, params: { post: { message: 'Hello, world!', user_id: user.id } }
      post = Post.find_by(message: 'Hello, world!')
      delete :destroy, params: { id: post.id }
      expect(response).to redirect_to(posts_path)
    end
  end
end
