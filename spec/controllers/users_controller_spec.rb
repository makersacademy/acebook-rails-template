require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET /show " do
    it "responds with 200" do
      get :show
      expect(response).to have_http_status(200)
    end
    it "adds user to database" do
      expect{User.create}.to change{User.count}.by(1)
    end
  end
end
