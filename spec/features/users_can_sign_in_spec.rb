require 'rails_helper'


RSpec.feature "Sign In", type: :feature do

    scenario "Successful sign in" do
      signup_as_new_user('jess')
      fill_in "Email", with: "jess@lizard.com"
      fill_in "Password", with: "password"
      click_button "Login"
      expect(page).to have_content "Dr jess Lizard"
      expect(page).to have_content "Profile Information"
      
    end

    scenario "Unsuccessful sign in" do
      signup_as_new_user('jess')
      fill_in "Email", with: "jess@lizard.com"
      fill_in "Password", with: "wrong password aaaaa"
      click_button "Login"
      expect(page).to have_content "Email or password is invalid"
      expect(page).to have_current_path('/')
    end

end
