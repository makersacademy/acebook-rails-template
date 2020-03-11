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
    fill_in "user_email", with: "testexample.com" # invalid, not am email
    fill_in "user_password", with: "example"
    fill_in "user_password_confirmation", with: "example"
    click_button("Sign up")
    expect(page).to have_content("Email is invalid")
  end

end