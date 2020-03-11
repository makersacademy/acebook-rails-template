require 'rails_helper'

RSpec.feature "Sign up", type: :feature do

  scenario 'User can sign up' do
    visit('/users/sign_up')
    fill_in "user_email", with: "test@example.com"
    fill_in "user_password", with: "example"
    fill_in "user_password_confirmation", with: "example"
    click_button("Sign up")
    expect(current_path).to eq('/')
  end

  scenario "User can't sign up with something other than an email address" do
    visit('/users/sign_up')
    fill_in "user_email", with: "testexample.com" # invalid, not an email
    fill_in "user_password", with: "example"
    fill_in "user_password_confirmation", with: "example"
    click_button("Sign up")
    expect(page).to have_content("Email is invalid")
  end

  scenario "User can't sign up with something with password less than 6 (inclusive) characters" do
    visit('/users/sign_up')
    fill_in "user_email", with: "test@example.com" 
    fill_in "user_password", with: "12345" #not a valid password
    fill_in "user_password_confirmation", with: "12345"
    click_button("Sign up")
    expect(page).to have_content("Password is too short")
  end

  scenario "User should be able to signup with a valid password (6 characters)" do
    visit('/users/sign_up')
    fill_in "user_email", with: "test@example.com" 
    fill_in "user_password", with: "123456" # password is valid
    fill_in "user_password_confirmation", with: "123456"
    click_button("Sign up")
    expect(current_path).to eq('/')
  end

  scenario "User can't sign up with something with password more than 10 (inclusive) characters" do
    visit('/users/sign_up')
    fill_in "user_email", with: "test@example.com" 
    fill_in "user_password", with: "12345678910" # not a valid password
    fill_in "user_password_confirmation", with: "12345678910"
    click_button("Sign up")
    expect(page).to have_content("Password is too long")
  end

  scenario "User can't sign up if the two passwords don't match" do
    visit('/users/sign_up')
    fill_in "user_email", with: "test@example.com" 
    fill_in "user_password", with: "1234569" # not a valid password
    fill_in "user_password_confirmation", with: "1234567"
    click_button("Sign up")
    expect(page).to have_content("Password confirmation doesn't match Password ")
  end

  scenario "User can't visit anypage unless he's signed up" do
    visit('/posts/new')
    expect(current_path).to have_content('/')
  end

end