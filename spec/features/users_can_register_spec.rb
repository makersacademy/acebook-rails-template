require 'rails_helper'

RSpec.feature "Registration", type: :feature do
  scenario "Can successfully register as a user" do
    visit "/users/new"
    fill_in "Name", with: "Jeff"
    fill_in "Email", with: "jeff@hotmail.com"
    fill_in "Password", with: "password1"
    click_button "Submit"
    expect(page).to have_content("Registration successful!")
  end
end
