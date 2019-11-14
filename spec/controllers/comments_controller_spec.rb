require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  controller_login_user
  describe "POST /" do
    it 'reponds with 302' do
      post1 = Post.create(message: "Hello, world!", user_id: @user.id, wall_id: @user.id)
      post :create, params: { comment: { body: "Comment" }, post_id: post1.id, user_id: @user.id }
      expect(response).to have_http_status(302)
    end

    it 'creates a comment' do
      post1 = Post.create(message: "Hello, world!", user_id: @user.id)
      post :create, params: { comment: { body: "Comment" }, post_id: post1.id, user_id: @user.id }
      expect(Comment.find_by(body: "Comment")).to be
    end
  end

  describe 'GET :id/edit ' do
    it "responds with 200" do
      post = Post.create(message: "Hello, world!", user_id: @user.id)
      comment = Comment.create(body: "Comment", user_id: @user.id, post_id: post.id)
      params = { post_id: post.id, id: comment.id }
      get :edit, params: params
      expect(response).to have_http_status(200)
    end

    it "won't let you edit someone elses comment" do
      post = Post.create(message: "Hello, world!", user_id: @user.id)
      user2 = User.create(username: 'Tan', email: 'test2@test.com', password: 'password1', password_confirmation: 'password1')
      comment = Comment.create(body: "Comment", user_id: user2.id, post_id: post.id)
      params = { post_id: post.id, id: comment.id }
      get :edit, params: params
      allow_any_instance_of(CommentsController).
      to receive_message_chain(:flash, :[]=).
      with(:alert, "Sorry! You can't edit someone else's comment.")
      expect(response).to have_http_status(302)
    end

    it "won't let you edit after 10 minutes" do
      post = Post.create(message: "Hello, world!", user_id: @user.id)
      comment = Comment.create(body: "Comment", user_id: @user.id, post_id: post.id)
      Timecop.freeze(Time.now + 601.seconds)
      params = { post_id: post.id, id: comment.id }
      get :edit, params: params
      allow_any_instance_of(CommentsController).
      to receive_message_chain(:flash, :[]=).
      with(:alert, "10 minutes exceeded: you can no longer edit the comment.")
      expect(response).to have_http_status(302)
    end
  end

  describe 'PATCH/:id ' do
    it 'edits a comment' do
      post = Post.create(message: "Hello, world!", user_id: @user.id)
      comment = Comment.create(body: "Comment", user_id: @user.id, post_id: post.id)
      params = { :comment => { body: "Edited comment" }, id: comment.id, post_id: post.id }
      patch :update, params: params
      expect(Comment.all.first.body).to eq "Edited comment"
    end
  end

  describe 'DELETE/:id ' do
    it 'deletes a comment' do
      post = Post.create(message: "Hello, world!", user_id: @user.id)
      comment = Comment.create(body: "Comment", user_id: @user.id, post_id: post.id)
      params = { id: comment.id, post_id: post.id }
      delete :destroy, params: params
      expect(Comment.all.length).to eq 0
    end

    it "won't delete a comment if it is not current user" do
      post = Post.create(message: "Hello, world!", user_id: @user.id)
      user2 = User.create(username: 'Tan', email: 'test2@test.com', password: 'password1', password_confirmation: 'password1')
      comment = Comment.create(body: "Comment", user_id: user2.id, post_id: post.id)
      params = { id: comment.id, post_id: post.id }
      delete :destroy, params: params
      expect(Comment.all.length).to eq 1
    end
  end
end
