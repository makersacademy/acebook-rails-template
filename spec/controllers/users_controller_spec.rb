require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET /users/new" do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /users" do
    it "responds with 200" do
      post :create, params: { user: { first_name: "Elishka", last_name: "Flint", email_address: "elishka@keepitrails.com", password: "pas55w0rd" }}
      expect(response).to redirect_to(user_url)
    end

    it "creates a user" do
      post :create, params: { user: { first_name: "Elishka", last_name: "Flint", email_address: "elishka@keepitrails.com", password: "pas55w0rd" }}
      expect(User.find_by(email_address: "elishka@keepitrails.com")).to be
    end
  end

  describe "GET /users/id" do
    it "responds with 200" do
      get :show
      expect(response).to have_http_status(200)
    end
  end

end
