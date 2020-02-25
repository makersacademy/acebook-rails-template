require 'rails_helper'

RSpec.feature "signup", type: :feature do
  scenario "Throws error with invalid input" do
    visit "/"
    fill_in "user[username]", with: ""
    fill_in "user[email]", with: "useR@invalid"
    fill_in "user[password]", with: "foo"
    fill_in "user[password_confirmation]", with: "bar"
    click_button "Create my account"
    expect(page).to have_content("The form contains 4 errors.")
  end
end
