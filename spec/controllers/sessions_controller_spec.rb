require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  # describe "GET #create" do
  #   it "logs a user in and redirects them to the posts page" do
  #     post login_path, params: { session: { email: "", password: "" } }
  #     expect(response).to redirect_to '/posts'
  #   end
  # end

  describe "GET #destroy" do
    it "logs the user out and returns them to the login page" do
      get :destroy
      expect(session[:user_id]).to be nil
      expect(response).to redirect_to '/login'
    end
  end
end
