require 'rails_helper'
RSpec.describe CommentsController, type: :controller do

  describe "POST #create " do

    def create_comment
      comment = FactoryBot.build(:comment)
      user = FactoryBot.create(:user)
      allow(Post).to receive(:find).and_return(comment.post)
      allow(controller).to receive(:current_user).and_return(user)
      post :create, params: { post_id: comment.post.id, comment: { message: "A Comment" } }
    end

    it "creates a comment in the db" do
      expect { create_comment }.to change { Comment.count }.by(1)
    end

    it "responds with 302" do
      create_comment
      expect(response).to have_http_status(302)
    end
  end

end
