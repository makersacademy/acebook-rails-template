require 'rails_helper'
RSpec.feature 'Signin', type: :feature do
  scenario "A user signs in and see's their account details" do
    signup_and_click
    logout
    login

    expect(page).to have_content('1')
  end

  scenario "Signin is case sensitive" do
    signup_and_click
    logout
    login_with_wrong_case_sensitive_details

    expect(page).to have_content('you cretin')
  end

  scenario "can't sign in with the wrong email" do
    signup_and_click
    logout
    login_with_wrong_email

    expect(page).to have_content('you cretin')
  end

  scenario "can't sign in with the wrong password" do
    signup_and_click
    logout
    login_with_wrong_password

    expect(page).to have_content('you cretin')
  end


end
