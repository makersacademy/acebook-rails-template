# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before(:each) do
    user = FactoryBot.create(:user)
    @new_post = FactoryBot.create(:post, :new)
    sign_in(user)
  end

  describe 'GET /' do
    it 'responds with 200' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /show' do
    it 'responds with 200' do
      get :show, params: { id: @new_post.id }
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /new ' do
    it 'responds with 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /create' do
    it 'redirects to the posts page' do
      post :create, params: { post: { message: 'Hello, world!' } }
      expect(response).to redirect_to posts_path
    end

    it 'creates a post' do
      post :create, params: { post: { message: 'Hello, world!' } }
      expect(Post.find_by(message: 'Hello, world!')).to be
    end

    it 'renders the same page if post is empty' do
      post :create, params: { post: { message: '' } }
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /edit/:id' do
    it 'edit responds with 200' do
      get :edit, params: { id: @new_post.id }
      expect(response).to have_http_status(200)
    end

    it 'update method changes post' do
      patch :update, params: { id: @new_post.id, post: { message: 'bye' } }
      expect(Post.find_by(message: 'bye')).to be
    end
  end

  describe 'PATCH /update/:id' do
    it 'redirects to the post view after a successful update' do
      patch :update, params: { id: @new_post.id, post: { message: 'Bye' } }
      expect(response).to redirect_to post_path
    end
    it 'update method changes post message' do
      patch :update, params: { id: @new_post.id, post: { message: 'bye' } }
      expect(Post.find_by(message: 'bye')).to be
    end
    it 'renders the same page if update is empty' do
      patch :update, params: { id: @new_post.id, post: { message: '' } }
      expect(response).to have_http_status(200)
    end
  end

  describe 'PUT update/:id' do
    it "doesn't allow post to be updated after 10 mins have passed" do
      old_post = FactoryBot.create(:post, :old)
      patch :update, params: { id: old_post.id, post: { message: 'Bye' } }
      expect(flash[:alert]).to be_present
    end
  end

  describe 'DELETE /destroy/:id' do
    it 'redirects to the home page after delete' do
      delete :destroy, params: { id: @new_post.id }
      expect(response).to redirect_to posts_path
    end

    it 'should delete a post' do
      expect { @new_post.destroy }.to change(Post, :count).by(-1)
    end
  end
end
