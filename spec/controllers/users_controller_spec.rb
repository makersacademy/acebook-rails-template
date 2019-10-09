require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET /" do
    login_user

    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end
end
