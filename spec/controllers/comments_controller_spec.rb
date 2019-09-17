require "rails_helper"

RSpec.describe CommentsController, type: :controller do
  describe "POST /" do
    it "creates a new comment" do
      user = sign_in
      # post = Post.create(message: "oWo", user_id: user.id)
      post = FactoryBot.create(:post, user_id: user.id)
      # p sign_in
      post(:create, params: { post_id: post.id, comment: { body: "I am a comment"} })
      # p Comment.all
      expect(Comment.find_by(body: "I am a comment")).to be
    end
  end
end
