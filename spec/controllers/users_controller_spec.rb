require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #index" do
    it "returns http success" do

      request.session[:user_id] = 1

      get :index
      expect(response).to have_http_status(:success)
    end
  end

 end
