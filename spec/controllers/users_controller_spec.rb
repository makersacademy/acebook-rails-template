require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET /new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /create" do
    it "lets a user sign up" do
      post :create, params: { user: { username: "lotty", password: "password12" } }
      expect(User.find_by(username: "lotty")).to be
    end
  end

  describe "POST /authenticate" do
    it "responds with 200" do
      post :authenticate, params: { user: { username: 'Charlotte', password: 'this_is_a_password' } }
      expect(response).to redirect_to("/users")
    end
  end
  
  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

end