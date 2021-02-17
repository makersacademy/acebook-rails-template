require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "GET /new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /create" do
    it "responds with 200" do
      post :create, params: { user: { username: "testing_user", password: "password"} }
      expect(response).to redirect_to("/")
    end
  end

  describe "DELETE /destroy" do
    it "responds with 200" do
      delete :destroy
      expect(response).to redirect_to("/")
    end
  end 
end
