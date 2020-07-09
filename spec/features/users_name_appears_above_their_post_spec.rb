require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  before(:each) do
    visit "/"
    click_link "Sign Up"
    fill_in "user_firstname", with: "testfirstname"
    fill_in "user_lastname", with: "testlastname"
    fill_in "user_email", with: "test@gmail.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_button "Create User"
    fill_in "email", with: "test@gmail.com"
    fill_in "password", with: "123456"
    click_button "Login"
  end

  scenario "Can see their name above their post" do
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("testfirstname")
  end

  # Needs sign out button implementation
  # scenario "Can see another users name above that users post" do
  #   fill_in "Message", with: "Hello, world!"
  #   click_button "Submit"
  #   click_button "Sign Out"
  #   click_link "Sign Up"
  #   fill_in "First Name", with: "test2firstname"
  #   fill_in "Last Name", with: "testlastname"
  #   fill_in "Email", with: "test2@gmail.com"
  #   fill_in "Password", with: "123456"
  #   fill_in "Confirm Password", with: "123456"
  #   click_button "Create User"
  #   fill_in "Email", with: "test2@gmail.com"
  #   fill_in "Password", with: "123456"
  #   click_button "Login"
  #   expect(page).to have_content("testfirstname")
  # end
end