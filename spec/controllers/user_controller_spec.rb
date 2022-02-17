require 'rails_helper'

RSpec.feature "Creating a new user", type: :feature do
  it "should create a user" do
    visit "/users/sign_up"
    fill_in "Name", with: "Calvin"
    fill_in "Surname", with: "Harris"
    fill_in "Email", with: "calvin@epicraves.co.uk"
    fill_in "Password", with: "Hello, world!"
    fill_in "Password confirmation", with: "Hello, world!"
    click_button "Sign up"

    expect(page).to have_current_path('/users')
  end
end