require 'rails_helper'

RSpec.feature "Logout", type: :feature do
  scenario "successful logout" do
    create_user
    user_login
    click_link "Log out"
    expect(page).to_not have_content("Logged in as: test")
    expect(page).to have_link("Log in")
  end
end
