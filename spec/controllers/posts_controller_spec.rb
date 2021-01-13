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

<<<<<<< HEAD
  describe 'DELETE /' do
    it 'deletes a post by the current user' do
      post = Post.create(message: 'Hello, world!', user_id: @user.id)
      expect { delete :destroy, params: { id: post.id } }.to change(Post, :count).by(-1)
      expect(Post.find_by(id: post.id)).to be_nil
    end

    it 'does not delete a post by a different user' do
      author = User.create(email: 'testenv2@example.com', password: 'testpass')
      post_by_author = Post.create(message: 'Hello, world!', user_id: author.id)
      expect { delete :destroy, params: { id: post_by_author.id } }.to change(Post, :count).by(0)
=======
  describe ' UPDATE /  ' do
    it 'Updates a post by its user ' do
      post = Post.create(message: 'Hello, World', user_id: @user.id)
>>>>>>> A post can show a date when it was created
    end
  end
end
