require 'rails_helper'
require_relative '../support/feature_web_helpers'

RSpec.feature "User authentication", type: :feature do
  scenario "User unable to sign in if not registered" do
    visit "/"
    first(:linkhref, "/login").click
    fill_in "user_email", with: 'test@email.com'
    fill_in "user_password", with: "password"
    click_button "Sign in"
    expect(current_path).to eq("/users/sign_in")
  end

  scenario "User unable to sign up if no email provided" do
    visit "/"
    fill_in "user_first_name", with: 'first name'
    fill_in "user_last_name", with: 'last name'
    fill_in "user_password", with: 'password'
    fill_in "user_password_confirmation", with: 'password'
    click_button "Sign up"
    expect(current_path).to eq("/users")
    expect(page).to have_content("can't be blank")
  end

  scenario "User unable to sign up if no passwords provided" do
    visit "/"
    fill_in "user_first_name", with: 'first name'
    fill_in "user_last_name", with: 'last name'
    fill_in "user_email", with: 'test@email.com'
    click_button "Sign up"
    expect(page).to have_content("can't be blank")
  end

  scenario "User unable to sign up if passwords do not match" do
    visit "/"
    fill_in "user_first_name", with: 'first name'
    fill_in "user_last_name", with: 'last name'
    fill_in "user_email", with: 'test@email.com'
    fill_in "user_password", with: 'password'
    fill_in "user_password_confirmation", with: 'asd'
    click_button "Sign up"
    expect(current_path).to eq("/users")
    expect(page).to have_content("doesn't match Password")
  end

  scenario "User unable to sign up if no first name" do
    visit "/"
    fill_in "user_last_name", with: 'last name'
    fill_in "user_email", with: 'test@email.com'
    fill_in "user_password", with: 'password'
    fill_in "user_password_confirmation", with: 'password'
    click_button "Sign up"
    expect(current_path).to eq("/users")
    expect(page).to have_content("can't be blank")
  end

  scenario "User unable to sign up if no last name" do
    visit "/"
    fill_in "user_first_name", with: 'first name'
    fill_in "user_email", with: 'test@email.com'
    fill_in "user_password", with: 'password'
    fill_in "user_password_confirmation", with: 'password'
    click_button "Sign up"
    expect(current_path).to eq("/users")
    expect(page).to have_content("can't be blank")
  end

  scenario "User unable to sign up if email is not unique" do
    visit "/"
    fill_in_signup_form_and_submit
    find(:linkhref, "/users/sign_out").click
    expect(current_path).to eq("/")
    first(:linkhref, "/signup").click
    fill_in "user_email", with: 'test@email.com'
    click_button "Sign up"
    expect(current_path).to eq("/users")
    expect(page).to have_content("has already been taken")
  end
end
