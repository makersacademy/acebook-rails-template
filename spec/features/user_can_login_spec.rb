require 'rails_helper'

RSpec.feature "login", type: :feature do
  scenario "Throws error with invalid input" do
    visit "/login"
    fill_in "session[email]", with: "test@gmail.com"
    fill_in "session[password]", with: "foo"
    click_button "Log in"
    expect(page).to have_content("Invalid email/password combination")
  end
end
