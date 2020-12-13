require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET /new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "redirects to the post page" do
      post :create, params: { user: { email:"example@example.com",password:"examplepass" } }
      expect(response).to redirect_to(posts_url)
    end

    it "creates a user" do
      post :create, params: { user: { email:"example@example.com",password:"examplepass" }}
      expect(User.find_by(email:"example@example.com")).to be
    end
  end
end
