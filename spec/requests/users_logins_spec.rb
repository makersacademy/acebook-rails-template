require 'rails_helper'

RSpec.describe "UsersLogins", type: :request do
  describe "GET /users_logins" do
    it "works! (now write some real specs)" do
      get '/login'
      expect(response).to have_http_status(200)
    end
  end
end
