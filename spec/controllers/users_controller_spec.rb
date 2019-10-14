require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  login_user
  describe "GET show" do
    it "responds with 200 on successful login" do
      get :show
      expect(response).to have_http_status(200)
      expect(@user.email).to eq("dan2@dan.com")
    end
    it "returns the signed in user from the database" do
      expect(@user.email).to eq("dan2@dan.com")
    end
  end
end
