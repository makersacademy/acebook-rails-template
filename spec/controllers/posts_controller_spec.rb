require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before do
    @user = User.create(email: 'testenv@example.com', password: 'testpass')
    sign_in @user
  end

  describe 'GET /new ' do
    it 'responds with 200' do
      get :new
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /' do
    it 'responds with 200' do
      post :create, params: { post: { message: 'Hello, world!' } }
      expect(response).to redirect_to("/#{@user.id}")
    end

    it 'creates a post' do
      Post.create(message: 'Hello, world!', user_id: @user.id)
      expect(Post.find_by(message: 'Hello, world!')).to be
    end
  end

  describe 'GET /' do
    it 'responds with 200' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe ' UPDATE /  ' do
    it 'Updates a post by its user ' do
      post = Post.create(message: 'Hello, World', user_id: @user.id)
    end
  end
end
