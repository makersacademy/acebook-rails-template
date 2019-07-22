require "rails_helper"
require 'sign_up_helper'

RSpec.feature "User Sign In Redirection", type: :feature do
  scenario "User when log-in gets redirect_to /posts" do
    sign_up
    click_link "Logout"
    click_link "Login"
    fill_in "Email", with: "tesymcemail@email.com"
    fill_in "Password", with: "password"
    click_button "Log in"
    expect(page).to have_current_path '/posts'
  end

  scenario "User gets redirected to index when attempt to visit another URL when not logged in", type: :feature do
    visit '/'
    visit '/posts'
    expect(page).to have_current_path '/'
  end
end
