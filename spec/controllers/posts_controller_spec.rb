require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  before 'sign-up and login' do
    user = User.new(first_name: 'test', email: 'test@test.com', password: '123123')
    instantiated_user = User.find_by(id: user.id)
  end

  describe 'GET /new ' do
    it 'responds with 200 (REDIRECT)' do
      get :new
      expect(response).to have_http_status(302)
    end
  end
=begin
  describe 'POST /' do
    it 'responds with 200' do
      post :create, params: { post: { message: 'Hello, world!' } }
      expect(response).to redirect_to(posts_url)
    end

    it 'creates a post' do
      post :create, params: { post: { message: 'Hello, world!' } }
      expect(Post.find_by(message: 'Hello, world!')).to be true
    end
  end

  describe 'GET /' do
    it 'responds with 200' do
      get :index
      expect(response).to have_http_status(200)
    end
  end
=end
end
