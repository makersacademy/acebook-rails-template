require 'rails_helper'
require 'helpers/create_user'

RSpec.feature "User sign up", type: :feature do
  scenario "Users can sign up with appropriate name, email address and valid password" do
    visit "/signup"
    fill_in "user_name", with: "Gulliver"
    fill_in "user_email", with: "gulliver@mail.com"
    fill_in "user_password", with: "travels"
    fill_in "user_password_confirmation", with: "travels"
    click_button "Create my account"
    expect{page}.not_to raise_error
  end

  scenario "Users can't sign up without filling in name field" do
    create_user_with_empty_name
    expect(page).to have_content "Name can't be blank"
  end

  scenario "Users can't sign up without matching password and password confirmation" do
    create_user_with_non_matching_password
    expect(page).to have_content "Password confirmation doesn't match Password"
  end

  scenario "Email addresses must be unique" do
    create_user
    visit "/signup"
    fill_in "user_name", with: "Gulliver"
    fill_in "user_email", with: "new_user@email.com"
    fill_in "user_password", with: "travels"
    fill_in "user_password_confirmation", with: "travels"
    click_button "Create my account"
    expect(page).to have_content "Email has already been taken"
  end

  scenario "Users have a default image on sign up" do
    create_user
    visit '/'
    click_link 'Log In'
    fill_in "Email", with: "new_user@email.com"
    fill_in "Password", with: "Password123"
    click_button "Log in"
    visit '/users/20'
    expect(page).to have_xpath("//img[contains(@src, 'default.jpg')]")
  end
end
