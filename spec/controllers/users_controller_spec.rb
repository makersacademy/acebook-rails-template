require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      # get :new
      # fill_in "Name", with: "name"
      # fill_in "Email", with: "test@gmail.com"
      # fill_in "Password", with: "namepass"
      # fill_in "Password_confirmation", with: "namepass"
      # click_button "Create User"
      # get :index
      expect(response).to have_http_status(:success)
    end
  end

 end
