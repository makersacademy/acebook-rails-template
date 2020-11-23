require 'rails_helper'

RSpec.feature "Sign Out", type: :feature do
  scenario "Can sign out" do
    add_new_user
    visit '/sessions/new'
    fill_in "email", with: "test@testing.com"
    fill_in "password", with: "test1234"
    click_button("Log In")
    click_button("Log Out")

    expect(page).to have_content("Logged out!")
    expect(page).not_to have_content("Test Person")
  end
end
