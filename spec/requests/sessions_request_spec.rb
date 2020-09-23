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
      visit "/signup"
      fill_in "user[email]",	with: "test@test.com"
      fill_in "user[password]",	with: "password"
      fill_in "user[password_confirmation]",	with: "password"
      click_on('Create User')
      fill_in "email",	with: "test@test.com"
      fill_in "password",	with: "password"
      click_on('Login')
      expect(page).to have_content("test@test.com")
      click_on('Log Out')
      expect(page).not_to have_content("test@test.com")
  end
end
