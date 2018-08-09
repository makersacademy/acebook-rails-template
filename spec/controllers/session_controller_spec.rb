require 'rails_helper'

RSpec.describe SessionController, type: :controller do
  describe "GET /session/new" do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /session" do

    before(:each) do
      @user = User.create(first_name: "Elishka", last_name: "Flint", email: "elishka@keepingitrails.com", password: "pa55w0rd")
      post :create, params: { email: "elishka@keepingitrails.com", password: "pa55w0rd" }
    end

    it "redirects to the user_url" do
      expect(response).to redirect_to("/")
    end

    it "creates a session" do
      expect(session[:current_user_id]).to equal(@user.id)
    end
  end
end
