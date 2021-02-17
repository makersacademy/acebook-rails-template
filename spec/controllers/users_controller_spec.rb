require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET /new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      post :create, params: { user: { username: "testing_user", password: "password", email: "someone@something.com" } }
      expect(response).to redirect_to("/login")
    end

    it "creates a user" do
      post :create, params: { user: { username: "testing_user", password: "password", email: "someone@something.com" } }
      expect(User.find_by(username: "testing_user")).to be
    end
  end
end
