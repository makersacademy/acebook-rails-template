require 'rails_helper'
RSpec.describe CommentsController, type: :controller do

  describe 'GET /new' do
    it 'responds with 302 (redirect) with unathenticated user' do
      get :new, params: {post_id: 1}
      expect(response).to have_http_status(200)
    end
  end

  before(:each) do
    @post = FactoryBot.create(:post)
    stub_current_user(@post.user)
  end

  describe 'GET /new' do
    it 'responds with 200' do
      get :new, params: {post_id: @post.id}
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /' do
    it 'responds with 200' do
      post :create, params: {comment: {comment: 'Nice comment' }, post_id: @post.id}
      expect(response).to redirect_to(posts_url)
    end

    it 'creates a comment' do
      post :create, params: {comment: {comment: 'Newly created comment' }, post_id: @post.id}
      comment = Comment.find_by(comment: 'Newly created comment')
      expect(comment).to be
      expect(comment.post.id).to be @post.id
      expect(comment.user.id).to be @post.user.id
      expect(comment.post.user.id).to be @post.user.id
    end
  end

  describe 'DELETE /' do
    it 'destroys the record' do
      comment = FactoryBot.create(:comment, post: @post, user: @post.user)
      delete :destroy, params: {id: comment.id, post_id: @post.id}
      expect(Comment.exists?(comment.id)).to be false
    end
  end

end
