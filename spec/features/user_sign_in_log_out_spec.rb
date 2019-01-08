require 'rails_helper'

RSpec.feature "User sign in and out actions", type: :feature do
  scenario "User can sign up" do
    visit "/"
    fill_in_signup_form_and_submit
    expect(page).to have_content("First name")
  end

  scenario "User can Log Out" do
    visit "/"
    fill_in_signup_form_and_submit
    find(:linkhref, "/users/sign_out").click
    expect(page).not_to have_content("first name")
  end

  scenario "User can sign up, log out, log in" do
    visit "/"
    fill_in_signup_form_and_submit
    expect(page).to have_content("First name")
    expect(current_path).to eq("/users/1")
    find(:linkhref, "/users/sign_out").click
    expect(current_path).to eq("/")
    expect(page).not_to have_content("first name")
    first(:linkhref, "/login").click
    fill_in_login_form_and_submit
    expect(current_path).to eq("/users/1")
    expect(page).to have_content("First name")
  end
end
