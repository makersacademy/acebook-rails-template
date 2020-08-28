require 'rails_helper'
require 'create_user_helper'

Rspec.feature "Login", type: :feature do
  scenario "successful login" do
    create_new_user
    expect(page).to have_content("Successfully created user account")
    fill_in "email", with: "email@email.com"
    fill_in "password", with: "123456"
    click_button "Login"
    expect(page).to have_content("Hi Some")
  end

  scenario "Invalid email" do
    create_new_user
    expect(page).to have_content("Successfully created user account")
    fill_in "email", with: "emailemail.com"
    fill_in "password", with: "123456"
    click_button "Login"
    expect(page).to have_content("Please check submitted information")
  end

  scenario "Unrecognised email" do
    create_new_user
    expect(page).to have_content("Successfully created user account")
    fill_in "email", with: "femail@email.com"
    fill_in "password", with: "123456"
    click_button "Login"
    expect(page).to have_content("Please check submitted information")
  end

  scenario "Wrong password" do
    create_new_user
    expect(page).to have_content("Successfully created user account")
    fill_in "email", with: "email@email.com"
    fill_in "password", with: "654321"
    click_button "Login"
    expect(page).to have_content("Please check submitted information")
  end
end
