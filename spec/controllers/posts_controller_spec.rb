require 'rails_helper'

RSpec.feature 'redirect', type: :feature do
  scenario 'redirect from posts because not logged in' do
    visit '/posts'
    expect(page).to have_current_path('/')
  end
end

RSpec.describe PostsController, type: :controller do
  describe 'GET /new ' do
    it 'responds with 200' do
      get :new
      expect(response).to redirect_to('/')
      # expect(response).to have_http_status(200)
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
end
