require 'rails_helper'
require_relative '../helpers/signing_up_spec'

RSpec.feature 'Signin', type: :feature do
 scenario 'User should be able to sign in from the index page' do
   sign_up_user
   click_button "Sign In"
   fill_in "email", with: "lisa@email.com"
   fill_in "password", with: "Password"
   click_button "Sign In"
   expect(current_path).to eq('/posts')
   click_button "Sign Out"
   expect(page).to have_content("You have logged out")
 end
end