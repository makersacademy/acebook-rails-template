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

  scenario "Can delete posts" do
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link "Delete"
    expect(page).not_to have_content("Hello, world!")
  end

  # Need sign out button
  # scenario "Can't delet someone else's post" do
  #   fill_in "Message", with: "Hello, world!"
  #   click_button "Submit"
  #   click_button "Sign Out"

  #   click_link "Sign Up"
  #   fill_in "First Name", with: "test2firstname"
  #   fill_in "Last Name", with: "test2lastname"
  #   fill_in "Email", with: "test2@gmail.com"
  #   fill_in "Password", with: "123456"
  #   fill_in "Confirm Password", with: "123456"
  #   click_button "Create User"
  #   fill_in "Email", with: "test2@gmail.com"
  #   fill_in "Password", with: "123456"
  #   click_button "Login"

  #   expect(page).not_to have_link("Delete")
  # end

end
