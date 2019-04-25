# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'Going to page when not logged in redirects to login' do
    it 'redirects to login page' do
      get :index
      expect(response).to redirect_to("/users/sign_in")
    end
  end

  # describe 'POST /' do
  #   it 'responds with 200' do
  #     post :create, params: { post: { message: 'Hello, world!' } }
  #     expect(response).to redirect_to(posts_url)
  #   end
  #
  #   it 'creates a post' do
  #     post :create, params: { post: { message: 'Hello, world!' } }
  #     expect(Post.find_by(message: 'Hello, world!')).to be
  #   end
  # end
  #
  # describe 'GET /' do
  #   it 'responds with 200' do
  #     get :index
  #     expect(response).to have_http_status(200)
  #   end
  # end
end
