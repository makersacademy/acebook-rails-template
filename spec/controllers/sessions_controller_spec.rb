require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST sessions#create" do
    it "should show user is in the session after log in" do
      user = User.create({ email: "beefboi@beefy.com", password: "BEEF" })
      post :create, params: { session: { email: "beefboi@beefy.com", password: "BEEF" } }
      expect(session[:user_id]).to eq user.id
    end
  end

  describe "DELETE sessions#destroy" do
    it "should show user is no longer in the session" do
      User.create({ email: "beefboi@beefy.com", password: "BEEF" })
      post :create, params: { session: { email: "beefboi@beefy.com", password: "BEEF" } }
      delete :destroy
      expect(session[:user_id]).to_not be
    end
  end
end
