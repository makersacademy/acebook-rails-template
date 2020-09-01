require 'rails_helper'
require 'create_user_helper'

RSpec.feature "Login", type: :feature do
  scenario "successful login" do
    create_new_user
    expect(page).to have_content("Successfully created user account")
    fill_in "session[email]", with: "email@email.com"
    fill_in "session[password]", with: "123456"
    click_button "Log in"
    expect(page).to have_content("Hi Some")
  end

  scenario "Invalid email" do
    create_new_user
    expect(page).to have_content("Successfully created user account")
    fill_in "session[email]", with: "mail@email.com"
    fill_in "session[password]", with: "123456"
    click_button "Log in"
    expect(page).to have_content("Please check the information submitted")
  end

  scenario "Unrecognised email" do
    create_new_user
    expect(page).to have_content("Successfully created user account")
    fill_in "session[email]", with: "femail@email.com"
    fill_in "session[password]", with: "123456"
    click_button "Log in"
    expect(page).to have_content("Please check the information submitted")
  end

  scenario "Wrong password" do
    create_new_user
    expect(page).to have_content("Successfully created user account")
    fill_in "session[email]", with: "email@email.com"
    fill_in "session[password]", with: "654321"
    click_button "Log in"
    expect(page).to have_content("Please check the information submitted")
  end
end
