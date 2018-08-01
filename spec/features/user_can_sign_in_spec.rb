require 'rails_helper'

RSpec.feature "Session/ Sign-in", type: :feature do

  before(:each) do
    successful_sign_up
  end

  scenario "A user can sign in with valid credentials" do
    successful_sign_in
    expect(page).to have_content("Welcome test_first_name")
  end

  # not implementing the below feature in this commit:

  scenario "A user signs in with invalid email address" do
    unsuccessful_sign_in_with_wrong_email
    expect(page).to have_content("Sorry, we do not recognise this email address")
  end

  scenario "A user signs in with incorrect password" do
    unsuccessful_sign_in_with_wrong_password
    expect(page).to have_content("Sorry, please check your password and try again")
  end
end
