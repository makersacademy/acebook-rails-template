# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:valid_attributes) do
    { message: "The Bee's Knees", user_id: user.id, profile_message: 3 }
  end

  let(:valid_session) { {} }

  let(:user) { FactoryBot.create(:user) }

  before :each do
    login_as(user, scope: :user)
  end

  describe 'GET /new ' do
    it 'responds with 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /' do
    it 'redirects to the root' do
      post :create, params: { post: { title: 'Hello, world!' } }
      expect(response).to redirect_to(root_url)
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

  describe 'PUT /' do
    it 'redirects to the profile if there is a profile_id' do
      post = Post.create! valid_attributes
      put :update, params: { id: post.to_param,
                             post: valid_attributes.merge(profile_id: 1),
                             profile_id: 1 },
                   session: valid_session
      expect(response).to redirect_to('/1')
    end
  end
end
