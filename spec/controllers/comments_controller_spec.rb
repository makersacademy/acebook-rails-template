require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  let(:user) { create(:user) }
  let(:postA) { create(:post, :user_id => user.id, :recipient_id => user.id, :message => "Beep boop") }

  before(:each) do
    sign_in user
  end

  describe "GET /comments/new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /comments" do
    it "responds with 200" do

      post :create, params: { comment: { message: "Excellent post!", post_id: postA.id } }
      expect(response).to redirect_to(root_path)
    end

    it "creates a comment" do

      post :create, params: { comment: { message: "Excellent post!", post_id: postA.id } }
      expect(Comment.find_by(message: "Excellent post!")).to be
    end
  end

end
