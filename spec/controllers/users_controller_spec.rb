require 'rails_helper'
RSpec.describe UsersController, type: :controller do

  before(:each) do
    request.env["HTTP_REFERER"] = "where_i_posted"
    @user = User.create(:name => "Amy Ace", :email => "amyace@gmail.com", :password => "123456")
    # sign_in @user
  end

  describe "GET /show " do
    it "responds with 200" do
      get :show
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /edit" do
    it "responds with 200" do
      get :edit
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      post :create, params: { user: { name: "Amy Ace", email: "amyace@gmail.com", password: "123456" } }
      expect(response).to redirect_to("where_i_posted")
    end

    it "creates a user" do
      post :create, params: { user: { name: "Amy Ace", email: "amyace@gmail.com", password: "123456" }  }
      expect(User.find_by(name: "Amy Ace")).to be
    end
  end
end
