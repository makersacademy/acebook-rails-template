require "rails_helper"

RSpec.describe PostsController, type: :controller do
  before(:each) do
    @user = User.create!({
      :email => "test@test.com",
      :password => "password",
    })
    sign_in @user
  end

  describe "GET /new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      post :create, params: { post: { message: "Hello, world!" } }
      expect(response).to redirect_to(posts_url)
    end
    
    it "creates a post and re routes user" do
      post :create, params: { post: { message: "Hello, world!" } }
      expect(response).to have_http_status(302)
    end
  end
end
