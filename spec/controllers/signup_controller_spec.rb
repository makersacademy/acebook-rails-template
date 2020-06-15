require 'rails_helper'

RSpec.describe SignupController, type: :controller do

  describe "GET /signup" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

end
