require 'rails_helper'
Devise::Test::ControllerHelpers

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:found)
    end
  end

end
