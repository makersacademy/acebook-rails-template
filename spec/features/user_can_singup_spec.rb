
require 'rails_helper'

RSpec.feature "Signup", type: :feature do
  scenario "Can signup with their name, last name, email and password" do
    visit "/"
    click_button "Sign up"
    fill_in "First_name", with: "Kevin"
    fill_in "Last_name", with: "Bacon"
    fill_in "Email", with: "email@bacon.com"
    fill_in "Password", with: "password"
    click_button "submit"
    expect(page).to have_content("Welcome")
  end
end
