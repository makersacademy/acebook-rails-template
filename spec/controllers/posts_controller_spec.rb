# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  # before(:each) do
  #   sign_up
  # end

  describe 'GET /new ' do
    it 'responds with 200' do
      get :index
      sign_up
      get :new
      expect(response).to have_http_status(302)
    end
  end

  describe 'POST /' do
    xit 'responds with 200' do
      user = User.create!(email: 'tests@example.com', password: 'f4k3p455w0rd')
      login_as(user, scope: :user)
      post :create, params: { post: { message: 'Hello, world!' } }
      expect(response).to redirect_to(posts_url)
    end

    it 'creates a post' do
      post :create, params: { post: { message: 'Hello, world!' } }
      expect(Post.find_by(message: 'Hello, world!')).to be
    end
  end

  describe 'GET /' do
    xit 'responds with 302' do
      get :index
      expect(response).to have_http_status(302)
    end
  end
end
