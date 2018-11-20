# frozen_string_literal: true

require 'rails_helper'
require 'web_helpers'

RSpec.describe PostsController, type: :controller do
  describe 'GET /new ' do
    it 'responds with 302 (redirect)' do
      get :new
      expect(response).to have_http_status(302)
    end
  end

  describe 'POST /' do
    before(:each) do
      session[:user_id] = 63
    end

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
    it 'responds with 302 (redirect)' do
      get :index
      expect(response).to have_http_status(302)
    end
  end
end
