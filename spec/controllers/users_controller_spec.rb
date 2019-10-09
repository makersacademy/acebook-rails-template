require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET /" do
    it "responds with 302 and redirects to sign_in page" do
      get :new
      expect(response).to have_http_status(302)
      expect(response['Location']).to eq("http://test.host/users/sign_in")
    end
  end

  describe "POST /" do
    it "posts new user info on sign up" do
      post :create, params: { user: { username: "Dan123", email: "dan@dan.com", password: "1234567", ethnicity: "asian" } }
      expect(response).to redirect_to(users_path + "/#{assigns(:user).id}" )
    end
  end

end
