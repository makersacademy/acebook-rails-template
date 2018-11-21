# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  # let(:user) {double :user, id: 1}

  describe 'GET /new ' do
    it 'responds with 302 (redirect) with unathenticated user' do
      get :new
      expect(response).to have_http_status(302)
    end
  end

  describe 'POST /' do
    before(:each) do
      user = FactoryBot.create(:user)
      stub_current_user(user)
    end

    it 'responds with 200' do
      post :create, params: { post: { message: 'Hello, world!' } }
      expect(response).to redirect_to(posts_url)
    end

    it 'creates a post' do
      post :create, params: { post: { message: 'Hello, world!' } }
      post = Post.find_by(message: 'Hello, world!')
      expect(post).to be
      expect(post.user.id).to be 1
    end
  end

  describe 'GET /' do
    it 'responds with 302 (redirect)' do
      get :index
      expect(response).to have_http_status(302)
    end
  end
end
