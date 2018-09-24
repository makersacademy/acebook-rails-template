require 'rails_helper'

RSpec.feature "Register", type: :feature do
  scenario "Can register a new user with email and password" do
    visit "/"
    fill_in "email", with: "test@test.com"
    fill_in "password", with: "test"
    find('input#submit').click
    expect(page).to have_content("Sign-up Successful!")
  end
end