require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /new" do
    it "returns http success" do
<<<<<<< HEAD
      get "/login"
      expect(response).to have_http_status(:success)
    end
  end
=======
      get "/sessions/new"
      expect(response).to have_http_status(:success)
    end
  end

>>>>>>> sign in css
end
