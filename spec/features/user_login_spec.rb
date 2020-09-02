require 'rails_helper'

RSpec.feature "Login", type: :feature do
  scenario "successful login" do
    create_user
    expect(page).to have_content("Logged in as: test")
    log_out_and_in
    fill_in "session[email]", with: "test@test.com"
    fill_in "session[password]", with: "123123"
    click_button "Log in"
    expect(page).to have_content("Logged in as: test")
  end

  scenario "Invalid email" do
    create_user
    expect(page).to have_content("Logged in as: test")
    log_out_and_in
    fill_in "session[email]", with: "test.test.com"
    fill_in "session[password]", with: "123123"
    click_button "Log in"
    expect(page).to have_content("Please check the information submitted")
  end

  scenario "Unrecognised email" do
    create_user
    expect(page).to have_content("Logged in as: test")
    log_out_and_in
    fill_in "session[email]", with: "email@email.com"
    fill_in "session[password]", with: "123123"
    click_button "Log in"
    expect(page).to have_content("Please check the information submitted")
  end

  scenario "Wrong password" do
    create_user
    expect(page).to have_content("Logged in as: test")
    log_out_and_in
    fill_in "session[email]", with: "test@test.com"
    fill_in "session[password]", with: "321321"
    click_button "Log in"
    expect(page).to have_content("Please check the information submitted")
  end
end
