require 'rails_helper'

RSpec.feature "Sign up", type: :feature do
  scenario "Can sign up " do
    visit "/"
    click_link("Sign up", match: :first)
    fill_in "Email", with: "emailstupid@duh.com!"
    fill_in "Password", with: "notapassword"
    fill_in "Password confirmation", with: "notapassword"
    click_button "Sign up"
    expect(page).to have_content("Logged in as emailstupid@duh.com")
  end
end

