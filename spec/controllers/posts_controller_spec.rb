require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe "GET /new " do

    xit "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
    
  end

  describe "POST /posts" do

    before(:each) do
      post :create, params: { post: { message: "Test message", user_id: 1 } }
    end

    it "responds with 200" do
      expect(response).to redirect_to("/users/1")
    end

    it "creates a user" do
      expect(Post.find_by(message: "Test message")).to be
    end
  end

end
