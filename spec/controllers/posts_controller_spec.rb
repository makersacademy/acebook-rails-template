require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before(:each) { sign_in }

  # test controller for editing post
  describe 'GET /edit' do
    it 'render the edit post page' do
      post = FactoryBot.create(:post)
      puts "user id of the post: #{post.user_id}"
      puts "id of the post: #{post.id}"
      get :edit, params: { id: post.id }
      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH /update' do
    it 'render the post index page' do
      post = FactoryBot.create(:post)
      patch :update, params: { id: post.id, post: { message: 'random message' } }
      expect(response).to redirect_to(posts_path)
    end
  end

  describe 'GET /new ' do
    it 'responds with 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /' do
    it 'responds with 200' do
      post :create, params: { post: { message: 'Hello, world!', user_id: 1 } }
      expect(response).to redirect_to(posts_url)
    end

    it 'creates a post' do
      post :create, params: { post: { message: 'Hello, world!', user_id: 1 } }
      expect(Post.find_by(message: 'Hello, world!')).to be_truthy
    end
  end

  describe 'GET /' do
    it 'responds with 200' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /' do
    it 'renders the index page' do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
