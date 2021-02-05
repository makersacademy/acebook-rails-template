require 'rails_helper'

RSpec.feature "Account login", type: :feature do
  scenario "user can login into account" do
    visit "/"
    within_fieldset :log_in do
      fill_in "username", with: "Charlotte"
      fill_in "password", with: "this_is_a_password"
      click_button "Log In"
    end
    expect(page).to have_content("You have logged in!")
  end

  scenario "invalid login" do
    visit "/"
    within_fieldset :log_in do
      fill_in "username", with: "Charlotte"
      fill_in "password", with: "wrong-password"
      click_button "Log In"
    end
    expect(page).to have_content("Incorrect username or password")
  end
end

