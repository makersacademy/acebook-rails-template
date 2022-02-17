require 'rails_helper'
RSpec.describe PostsController, type: :controller do

  before(:each) do

    request.env["HTTP_REFERER"] = "where_i_posted"
   
    @user = User.create(:email => "amyace@gmail.com", :password => "123456", :password_confirmation => "123456")
    @user2 = User.create(:email => "user2@gmail.com", :password => "123456", :password_confirmation => "123456")

    sign_in @user
    sign_in @user2
  end

  describe "GET /new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /" do
    it "responds with 302" do
      post :create, params: { post: { message: "Hello, world!", receiver_id: @user2.id, user_id: @user.id, feed: false } }
      expect(response).to redirect_to "where_i_posted"
    end

    it "creates a post" do 
      post :create, params: { post: { message: "Hello, world!", user_id: @user.id, receiver_id: @user2.id, feed: false  } }
      expect(Post.find_by(message: "Hello, world!")).to be_truthy
    end
  end

  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
