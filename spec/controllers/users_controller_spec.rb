require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #index" do
    it "returns http success" do

      request.session[:user] = User.create(name: "Will", email: "will@will.com", password: "hello12", password_confirmation: "hello12")

      get :index
      expect(response).to have_http_status(:success)
    end
  end

 end
