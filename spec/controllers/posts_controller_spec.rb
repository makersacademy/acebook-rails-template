require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'POST wall create' do
    it 'redirects to user wall' do
      user = sign_in
      post(:wall_create, params: { user_id: user.id, post: { message: 'This is a wall post on my own wall' } })
      expect(response).to redirect_to(user_url(user))
    end

    it 'makes a new post' do
      user = sign_in
      post(:wall_create, params: { user_id: user.id, post: { message: 'This is a wall post on my own wall' } })
      expect(Post.find_by(message: 'This is a wall post on my own wall')).to be
    end

    it 'makes a new post on a different user wall' do
      user0 = sign_in
      sign_out
      user1 = sign_in
      post(:wall_create, params: { user_id: user0.id, post: { message: 'This is a wall post on a diff wall' } })
      post_new = Post.find_by(message: 'This is a wall post on a diff wall')
      expect(post_new.user_id).to eq(user1.id)
      expect(post_new.to_user_id).to eq(user0.id)
    end
  end

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

    it 'updates a post' do
      sign_in
      post :create, params: { post: { message: 'Hello, world!' } }
      put :update, params: { id: Post.first.id, post: { message: 'Hello, Dream world' } }
      expect(Post.find_by(message: 'Hello, Dream world')).to be
    end

    it 'does not let you update a post to more than 4000 characters' do
      sign_in
      post :create, params: { post: { message: 'Hello, world!' } }
      put :update, params: { id: Post.first.id, post: { message: 'He' * 2001 } }
      expect(Post.find_by(message: 'He' * 2001)).not_to be
    end

    it 'deletes a post' do
      sign_in
      post :create, params: { post: { message: 'Hello, world!' } }
      delete :destroy, params: { id: Post.first.id, post: { message: 'Hello, world!' } }
      expect(Post.find_by(message: 'Hello, world!')).not_to be
    end

    it 'limits the number of characters in a post' do
      sign_in
      post :create, params: { post: { message: 'He' * 2001 } }
      expect(Post.find_by(message: 'He' * 2001)).not_to be
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
