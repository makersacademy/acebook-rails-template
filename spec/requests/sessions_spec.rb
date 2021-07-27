require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /new" do
    it "returns http success" do
<<<<<<< HEAD
      get "/login"
=======
      get "/sessions/new"
>>>>>>> feat: sessions controller
      expect(response).to have_http_status(:success)
    end
  end

end
