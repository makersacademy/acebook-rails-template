require 'rails_helper'

RSpec.describe SessionsController, type: :controller do


  describe "GET #login" do
    it "returns http success" do
      get :login
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #welcome" do
    it "returns http success" do
      get :welcome
      expect(response).to have_http_status(:success)
    end
  end

end
