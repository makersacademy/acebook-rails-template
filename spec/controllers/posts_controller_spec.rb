require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET /new ' do
    it 'responds with 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /' do
    it 'responds with 200' do
      post :create, params: { post: { message: 'Hello, world!' } }
      expect(response).to redirect_to(posts_url)
    end

    it 'creates a post' do
      user = User.create(fname: 'jon', lname: 'doe', email: 'john.doe@example.com', password: 'password')
      Post.create(message: 'Hello, world!', user_id: user.id)
      expect(Post.find_by(message: 'Hello, world!')).to be
    end
  end

  describe 'GET /' do
    it 'responds with 200' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'DELETE /' do
    it 'Able to delete a post' do
      post = Post.create(message: 'Hello, world!')
      post.destroy
      expect(Post.find_by(message: 'Hello, world!')).to_not be
    end
  end

  describe 'UPDATE /' do
    it 'Able to update a post' do
      user = User.create(fname: 'jon', lname: 'doe', email: 'john.doe@example.com', password: 'password')
      post = Post.create(message: 'Hello, world!', user_id: user.id)
      post.update(message: 'Updated message!')
      expect(Post.find_by(message: 'Updated message!')).to be
    end
  end
end
