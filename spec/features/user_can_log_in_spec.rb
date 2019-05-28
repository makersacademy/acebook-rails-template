require 'rails_helper'

RSpec.feature "Log in", type: :feature do

  before(:each) do
    visit("/users/sign_up")
  end

  scenario "Can see Login button" do
    expect(page).to have_link("Login")
  end

  scenario "Login form throws error if account doesn't exist" do
    click_link "Login"
    fill_in "Email", with: "test@email.com"
    fill_in "Password", with: "testpassword"
    click_button "Log in"
    expect(page).to have_content("Invalid Email or password")
  end
end
