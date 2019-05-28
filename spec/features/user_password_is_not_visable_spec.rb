require 'rails_helper'

RSpec.feature "Password Hider", type: :feature do
  scenario "Password converted into dots at sign up" do
    visit "/users/new"
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Doe"
    fill_in "Email", with: "john@doe.com"
    fill_in "Password", with: "john1234"
    expect(page).not_to have_content("john1234")
  end
  scenario "Password converted into dots at login" do
    visit "/login"
    fill_in "Email", with: "john@doe.com"
    fill_in "Password", with: "john1234"
    expect(page).not_to have_content("john1234")
  end
end
