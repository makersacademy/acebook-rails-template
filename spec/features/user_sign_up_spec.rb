require 'rails_helper'

RSpec.feature "Sign up", type: :feature do
  scenario "redirects to index if not signed up" do # failing
    visit "/"

    click_link "New post"

    expect(page).to_not have_content("Message")
    expect(page).to have_content("Sign up")
  end

  scenario "can enter an email and password" do
    visit "/users/sign_up"

    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"

    click_button "Sign up"

    expect(page).to have_content("Sign Out")
  end

  context 'If user enters an invaild email' do
    scenario "they see helpful information to indicate why the email was not valid" do
      visit "/users/sign_up"

      fill_in "Email", with: "this_will_fail.com"
      fill_in "Password", with: "123456"
      fill_in "Password confirmation", with: "123456"

      click_button "Sign up"

      expect(page).to have_content("1 error prohibited this user from being saved: Email is invalid")
    end
  end

  context 'When entering an invalid pasword' do
    scenario 'user enters < 6 characters: they see helpful information to indicate why the password was not valid' do
      
      visit "/users/sign_up"

      fill_in "Email", with: "test@test.com"
      fill_in "Password", with: "123"
      fill_in "Password confirmation", with: "123"

      click_button "Sign up"
      expect(page).to have_content('1 error prohibited this user from being saved: Password is too short (minimum is 6 characters)')
    end
  
    scenario 'user enters > 10 characters: they see helpful information to indicate why the password was not valid' do # failing
      
      visit "/users/sign_up"

      fill_in "Email", with: "test@test.com"
      fill_in "Password", with: "01234567891"
      fill_in "Password confirmation", with: "01234567891"

      click_button "Sign up"
      expect(page).to have_content('1 error prohibited this user from being saved: Password is too long (maximum is 10 characters)')
    end
  end

  context 'When they submit their details' do
    scenario 'redirects to their posts page with a message saying they were successful signing up' do # failing
      visit '/users/sign_up'

      fill_in "Email", with: "test@test.com"
      fill_in "Password", with: "0123456"
      fill_in "Password confirmation", with: "0123456"

      click_button "Sign up"

      expect(page).to have_content("Sign up successful")
    end
  end
end
