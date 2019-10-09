require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET /" do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "posts new user info on sign up" do
      post :create, params: { user: { username: "Dan123", email: "dan@dan.com", password: "1234567", ethnicity: "asian" } }
      expect(response).to redirect_to(users_path + "/#{assigns(:user).id}" )
    end
  end

end
