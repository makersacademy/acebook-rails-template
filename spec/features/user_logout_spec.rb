require 'rails_helper'
require 'create_user_helper'

RSpec.feature "Logout", type: :feature do
  scenario "successful logout" do
    create_new_user
    expect(page).to have_content("Successfully created user account")
    fill_in "session[email]", with: "email@email.com"
    fill_in "session[password]", with: "123456"
    click_button "Log in"
    expect(page).to have_content("Hi Some")
    click_link "Log out"
    expect(page).to have_link("Log in")
  end
end
