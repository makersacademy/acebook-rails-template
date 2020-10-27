# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  before(:each) do
    user = FactoryBot.create(:user)
    @new_post = FactoryBot.create(:post, :new)
    @new_comment = FactoryBot.create(:comment)
    sign_in(user)
  end

  describe 'GET /new ' do
    it 'responds with 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /create' do
    it 'redirects back to the posts page' do
      post :create, params: { comment: { comment: 'This is a comment', post_id: @new_post.id } }
      expect(response).to redirect_to posts_path
    end

    it 'creates a comment' do
      post :create, params: { comment: { comment: 'This is a comment', post_id: @new_post.id } }
      expect(Comment.find_by(comment: 'This is a comment')).to be
    end

    it 'renders the same page for empty comment' do
      post :create, params: { comment: { comment: '', post_id: @new_post.id } }
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /edit/:id' do
    it 'responds with 200' do
      get :edit, params: { id: @new_comment.id }
      expect(response).to have_http_status(200)
    end
  end

  describe 'PATCH /update' do
    it 'redirects back to the posts page' do
      patch :update, params: { id: @new_comment.id, comment: { comment: 'Oops' } }
      expect(response).to redirect_to(posts_path)
    end

    it 'update method changes comment' do
      patch :update, params: { id: @new_comment.id, comment: { comment: 'Oops' } }
      expect(Comment.find_by(comment: 'Oops')).to be
    end

    it 'renders the same page if new comment is empty' do
      patch :update, params: { id: @new_comment.id, comment: { comment: '' } }
      expect(response).to have_http_status(200)
    end
  end

  describe 'DELETE' do
    it 'responds with 200' do
      delete :destroy, params: { id: @new_comment.id }
      expect(response).to redirect_to posts_path
    end
    it 'should delete a post' do
      expect { @new_comment.destroy }.to change(Comment, :count).by(-1)
    end
  end
end
