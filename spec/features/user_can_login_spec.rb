require 'rails_helper'

RSpec.feature "Login", type: :feature do
  scenario "Can signup" do
    visit "/"
    click_button "Sign Up"
    fill_in "user[email]", with: "test@test.com"
    fill_in "user[password]", with: "123456"
    click_button "Save User"
    click_button "Login"
    fill_in "email", with: "test@test.com"
    fill_in "password", with: "123456"
    click_button "Login"
    expect(page).to have_content("Listing Posts")
  end
end