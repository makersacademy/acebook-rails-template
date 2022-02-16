require 'rails_helper'
RSpec.describe UsersController, type: :controller do

  before(:each) do
    @user = User.create(:name => "Amy Ace", :email => "amyace@gmail.com", :password => "123456")
    sign_in @user
  end

  describe "GET /show " do
    it "responds with 200" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      post :create, params: { user: { name: "Amy Ace", email: "amyace@gmail.com", password: "123456" } }
      expect(response).to redirect_to(current_user_path)
    end

    it "creates a post" do
      post :create, params: { user: { name: "Amy Ace", email: "amyace@gmail.com", password: "123456" }  }
      expect(User.find_by(name: "Amy Ace")).to be
    end
  end
end
