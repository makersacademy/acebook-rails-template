require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET /users/new" do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /users" do

    before(:each) do
      post :create, params: { user: { first_name: "Elishka", last_name: "Flint", email: "elishka@keepitrails.com", password: "pas55w0rd" }}
    end

    it "responds with 200" do
      expect(response).to redirect_to("/users/#{assigns(:user).id}")
    end

    it "creates a user" do
      expect(User.find_by(email: "elishka@keepitrails.com")).to be
    end
  end

  describe "PATCH /users/id/" do

    it "creates a post" do
      patch :update, params: { "user_id"=>"3", "message"=>"hello again", "id" =>"3"}
      expect(Post.find_by(message: "hello again")).to be
    end

    it "redirects to the same page" do
      patch :update, params: { "user_id"=>"3", "message"=>"hello again", "id" =>"3"}
      expect(response).to redirect_to("/users/3")
    end

  end

end
