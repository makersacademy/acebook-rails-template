require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  before(:each) do 
    user = FactoryBot.create(:user)
    @new_post = FactoryBot.create(:post) 
    sign_in(user)
  end 
  
  describe "GET / " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "redirects back to the posts page" do
      post :create, params: { comment: { comment: "This is a comment", post_id: @new_post.id } }
      expect(response).to redirect_to(posts_url)
    end

    it "creates a post" do

      post :create, params: { comment: { comment: "This is a comment", post_id: @new_post.id } }
      expect(Comment.find_by(comment: "This is a comment")).to be
    end
  end
  


end


