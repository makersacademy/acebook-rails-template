require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET /new ' do
    it 'responds with 200' do
      sign_in
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /' do
    it 'responds with 200' do
      sign_in
      post :create, params: { post: { message: 'Hello, world!' } }
      expect(response).to redirect_to(posts_url)
    end

    it 'creates a post' do
      sign_in
      post :create, params: { post: { message: 'Hello, world!' } }
      expect(Post.find_by(message: 'Hello, world!')).to be
    end

    it 'deletes a post' do
      sign_in
      post :create, params: { post: { message: 'Hello, world!' } }
      delete :destroy, params: {id: Post.first.id, post: {message: 'Hello, world!'} }
      expect(Post.find_by(message: "Hello, world!")).not_to be
  end
end


  describe 'GET /' do
    it 'responds with 200' do
      sign_in
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
