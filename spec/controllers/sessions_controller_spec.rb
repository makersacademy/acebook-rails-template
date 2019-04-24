require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  # describe "GET login" do
  #   it "should get the login page" do
  #     get login_path
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
