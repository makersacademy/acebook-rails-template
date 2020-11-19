require 'rails_helper'

RSpec.feature "Login", type: :feature do
  scenario "User can click login button and is redirected to login form" do
    visit('/')
    click_link "Login"
    expect(page).to have_content("Username")
  end
  scenario "User submits correct login details and is redirected to their posts page" do
    user_signup('arakno', 'arakno@makers.com', 'Arabella Knowles', 'makers4L')
    create_post("Hello, world!")
    click_link "Logout"
    user_login("arakno", "makers4L")
    expect(page).to have_content("Hello, world!")
  end
end