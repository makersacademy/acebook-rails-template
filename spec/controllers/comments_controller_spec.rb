require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  # let!(:post) {create(:post)}
  # let!(:comment) {create(:comment)}
  # let(:post_id) { post.id }
  # let(:id) { comment.id }

  before :each do
    @user = FactoryBot.create(:user)
    sign_in @user
  end

  describe "POST /" do
    it 'reponds with 200' do
      post1 = Post.create(message: "Hello, world!", user_id: @user.id)
      post :create, params: { comment: { message: "Comment" }, post_id: post1.id }
      expect(response).to redirect_to(posts_url)
    end

    it 'creates a comment' do
      post1 = Post.create(message: "Hello, world!", user_id: @user.id)
      post :create, params: { comment: { message: "Comment" }, post_id: post1.id }
      expect(Comment.find_by(message: "Comment")).to be
    end
  end

  describe 'GET :id/edit ' do
    it "responds with 200" do
      post = Post.create(message: "Hello, world!", user_id: @user.id)
      comment = Comment.create(message: "Comment", user_id: @user.id, post_id: post.id)
      params = { post_id: post.id, id: comment.id }
      get :edit, params: params
      expect(response).to have_http_status(200)
    end
  end

  describe 'PATCH/:id ' do
    it 'edits a comment' do
      post = Post.create(message: "Hello, world!", user_id: @user.id)
      comment = Comment.create(message: "Comment", user_id: @user.id, post_id: post.id)
      params = { :comment => { message: "Edited comment" }, id: comment.id, post_id: post.id }
      patch :update, params: params
      expect(Comment.all.first.message).to eq "Edited comment"
    end
  end

  describe 'DELETE/:id ' do
    it 'deletes a comment' do
      post = Post.create(message: "Hello, world!", user_id: @user.id)
      comment = Comment.create(message: "Comment", user_id: @user.id, post_id: post.id)
      params = { id: comment.id, post_id: post.id }
      delete :destroy, params: params
      expect(Comment.all.length).to eq 0
    end
  end

end
