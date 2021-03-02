# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET /new ' do
    it 'redirects users not logged in' do
      get :new
      expect(response).to have_http_status(302)
    end
  end

  describe 'GET /new ' do
    it 'responds with 200' do
      # get :sign_up
      # fill_in 'user[first_name]', with: 'Joe'
      # fill_in 'user[last_name]', with: 'Bloggs'
      # fill_in 'user[email]', with: 'joebloggs@test.com'
      # fill_in 'user[password]', with: 'password'
      # fill_in 'user[password_confirmation]', with: 'password'
      # click_button 'Sign up'
      get :new
      expect(response).to have_http_status(:ok)
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
      expect(response).to have_http_status(:ok)
    end
  end
end
