require 'rails_helper'

RSpec.feature "Login", type: :feature do
  scenario "User can click login button and is redirected to login form" do
    visit('/')
    click_link "Login"
    expect(page).to have_content("Username")
  end
end