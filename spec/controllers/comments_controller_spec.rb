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
    it "responds with 200" do
      post :create, params: { comment: { comment: "This is a comment" } }
      expect(response).to redirect_to(posts_url)
    end

  #   it "creates a post" do
  #     post :create, params: { comment: { comment: "Hello, world!" } }
  #     expect(Comment.find_by(message: "Hello, world!")).to be
  #   end
  # end


  end


end
