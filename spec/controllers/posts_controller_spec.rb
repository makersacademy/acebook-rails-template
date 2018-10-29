# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before :each do
    current_user = FactoryBot.create(:user)
    login_as(current_user, scope: :user)
  end

  describe 'GET /new ' do
    it 'responds with 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /' do
    it 'responds with 200' do
      post :create, params: { post: { title: 'Hello, world!' } }
      expect(response).to redirect_to(posts_url)
    end

    it 'creates a post' do
      user = User.all[0]
      Post.create(message: 'Hello, world!', user_id: user.id)
      expect(Post.find_by(message: 'Hello, world!')).to be
    end
  end

  describe 'GET /' do
    it 'responds with 200' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'DELETE /' do
    it 'deletes articles' do
      user = User.all[0]
      Post.create(message: 'Hello, world!', user_id: user.id)
      deletion_id = Post.all[0].id
      delete :destroy, params: { id: deletion_id }
      expect(Post.find_by(id: deletion_id)).not_to be
    end

    it 'responds with 302' do
      user = User.all[0]
      Post.create(message: 'Hello, world!', user_id: user.id)
      deletion_id = Post.all[0].id
      delete :destroy, params: { id: deletion_id }
      expect(response).to have_http_status(302)
    end
  end
end
