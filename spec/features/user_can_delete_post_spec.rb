require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  before(:each) do
    visit "/"
    click_link "Sign Up"
    fill_in "First Name", with: "testfirstname"
    fill_in "Last Name", with: "testlastname"
    fill_in "Email", with: "test@gmail.com"
    fill_in "Password", with: "123456"
    fill_in "Confirm Password", with: "123456"
    click_button "Create User"
    fill_in "Email", with: "test@gmail.com"
    fill_in "Password", with: "123456"
    click_button "Login"
  end

  scenario "Can delete posts" do
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link "Delete"
    expect(page).not_to have_content("Hello, world!")
  end
end