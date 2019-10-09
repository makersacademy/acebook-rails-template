require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET /" do
    it "responds with 302 and redirects to sign_in page" do
      get :new
      expect(response).to have_http_status(302)
      expect(response['Location']).to eq("http://test.host/users/sign_in")
    end
  end

  describe "POST /users/sign_in" do
    it "posts new user info on sign in" do
      post :create, params: { user: { email: "dan@dan.com", password: "1234567"} }
      expect(response.request["user"].values).to include("dan@dan.com", "1234567")
    end
  end

end
