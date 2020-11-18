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
      post :create, params: { user: { username: "arakno", full_name: "Arabella Knowles", email: "arakno@makers.com", password: "makers4L" } }
      expect(response).to redirect_to(posts_url)
    end
  end
end
