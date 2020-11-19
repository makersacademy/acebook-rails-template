require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET /new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end
  describe "POST /" do
    it "redirects to posts url" do
      post :create, params: { user: { username: "arakno", full_name: "Arabella Knowles", email: "arakno@makers.com", password: "makers4L" } }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(posts_url)
    end
    it "Email is not valid: redirects to /users/new" do
      post :create, params: { user: { username: "arakno", full_name: "Arabella Knowles", email: "araknomakers.com", password: "makers4L" } }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to('/users/new')
    end
    it "Username already in db: redirects to /users/new" do
      User.create(username: "arakno", full_name: "Arabella Knowles", email: "arakno@makers.com", password: "makers4L")
      post :create, params: { user: { username: "arakno", full_name: "Elsa Knowles", email: "ara@makers.com", password: "akers4L" } }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to('/users/new')
    end
    it "Email already in db: redirects to /users/new" do
      User.create(username: "arakno", full_name: "Arabella Knowles", email: "arakno@makers.com", password: "makers4L")
      post :create, params: { user: { username: "arakno101", full_name: "Arabella Knowles", email: "arakno@makers.com", password: "bakers4L" } }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to('/users/new')
    end
  end
end
