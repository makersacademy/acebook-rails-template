require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  controller_login_user
  describe "POST /" do
    it 'reponds with 302' do
      post1 = Post.create(message: "Hello, world!", user_id: @user.id, wall_id: @user.id)
      post :create, params: { comment: { body: "Comment" }, post_id: post1.id, user_id: 1 }
      expect(response).to have_http_status(302)
    end
  end
end
