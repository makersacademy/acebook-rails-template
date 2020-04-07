require 'rails_helper'

RSpec.feature "Timeline", type: :feature do

scenario "User can signup with valid credentials" do
    visit "/users/new"
    fill_in "user_name", with: "Tester"
    fill_in "user_email", with: "tester@mail.com"
    fill_in "user_password", with: "testing1"

    click_button "Submit"
    expect(page).to have_current_path("/posts")
  end

  scenario "User cannot signup with invalid email" do
    visit "/users/new"
    fill_in "user_name", with: "Tester"
    fill_in "user_email", with: "testermail"
    fill_in "user_password", with: "testing1"

    click_button "Submit"
    expect(page).to have_content("invalid email or password")
  end

    scenario "User cannot signup with invalid password" do
    visit "/users/new"
    fill_in "user_name", with: "Tester"
    fill_in "user_email", with: "tester@mail.com"
    fill_in "user_password", with: "testing1233445567899865434"

    click_button "Submit"
    expect(page).to have_content("invalid email or password")
  end

  scenario "users are signed in when they sign up" do
    visit "/users/new"
    fill_in "user_name", with: "Tester"
    fill_in "user_email", with: "tester@mail.com"
    fill_in "user_password", with: "testing"

    click_button "Submit"
    expect(page).to have_content("Welcome Tester")
  end
end
