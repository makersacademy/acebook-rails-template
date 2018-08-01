require 'rails_helper'

RSpec.feature "SignUp", type: :feature do

    scenario "A user can sign up with valid credentials" do
      successful_sign_up
      expect(page).to have_content("Welcome test_first_name!")
    end

    scenario "A user provides an password with less than 6 characters" do
      unsuccessful_sign_up_with_wrong_password
      fill_in 'Password', with: "pass"
      click_button "Sign Up"
      expect(page).to have_content("The password needs to be between 6-10 characters")
    end

    scenario "A user provides an password with more than 10 characters" do
      unsuccessful_sign_up_with_wrong_password
      fill_in 'Password', with: "passWordthatismorethan10Char"
      click_button "Sign Up"
      expect(page).to have_content("The password needs to be between 6-10 characters")
    end

end
