
require 'rails_helper'

RSpec.feature "Signup", type: :feature do
  scenario "Can signup with their name, last name, email and password" do
    visit "/users/new"
    fill_in "user[first_name]", with: "Kevin"
    fill_in "user[last_name]", with: "Bacon"
    fill_in "user[email]", with: "email@bacon.com"
    fill_in "user[password]", with: "password"
    click_button "Submit"
    expect(page).to have_content("Welcome")
  end
end
