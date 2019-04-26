require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE sessions#destroy" do
    it "checks user is out of session" do
      #need to add a unit test for log_out
    end
  end

end
