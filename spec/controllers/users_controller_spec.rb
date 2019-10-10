require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  login_user
  describe "GET /" do
    it "responds with 200 on successful login" do
      get :show
      expect(response).to have_http_status(200)
    end
  end
end
