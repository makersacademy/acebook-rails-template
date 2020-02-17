require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #login," do
    it "returns http success" do
      get :login
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #logout," do
    it "returns http success" do
      get :logout
      expect(response).to have_http_status(302)
      expect(session[:user_id]).to eq(nil)
    end
  end

end
