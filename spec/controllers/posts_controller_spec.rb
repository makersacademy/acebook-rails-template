require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET /new' do
    it 'responds with 200' do
      session[:user_id] = 1
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /' do
    it 'responds with 302' do
      @user = User.create(name: 'test', email: 'test@test.com', password: 'password', password_confirmation: 'password')
      session[:user_id] = @user.id
      post :create, params: { post: { message: 'Hello, world!' } }
      # current_user = User.all[0]
      # expect(response).to redirect_to(user_posts_path(current_user))
      expect(response).to have_http_status(302)
    end

    it 'creates a post' do
      @user = User.create(name: 'test', email: 'test@test.com', password: 'password', password_confirmation: 'password')
      session[:user_id] = @user.id
      post :create, params: { post: { message: 'Hello, world!' } }
      expect(Post.find_by(message: 'Hello, world!')).to be
    end
  end

  describe 'GET /' do
    it 'responds with 200' do
      session[:user_id] = 1
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
