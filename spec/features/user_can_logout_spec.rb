require 'rails_helper'

feature "Log out" do
  scenario "User can log out after signing up" do
    sign_up
    expect(page).to have_link("Log out")
    click_link "Log out"
    expect(page).to have_current_path('/welcome')
  end

  scenario "User can log out after logging in" do
    sign_up_log_in
    expect(page).to have_link("Log out")
    click_link "Log out"
    expect(page).to have_current_path('/welcome')
  end
end