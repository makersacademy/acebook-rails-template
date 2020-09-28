require 'rails_helper'

RSpec.describe "Sessions", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/sessions/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/login"
      expect(response).to have_http_status(:success)
    end
  end
end

RSpec.feature "Sessions", type: :feature do
  scenario "GET /destroy works" do
      signup_and_login
      expect(page).to have_content("testuser")
      click_on('Log Out')
      expect(page).not_to have_content("testuser")
  end
end
