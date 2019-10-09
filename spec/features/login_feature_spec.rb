require 'rails_helper'
require 'feature_helpers'

RSpec.feature "login", type: :feature do
	scenario "User can login to Acebook" do
		sign_up
		click_button "Sign out"
		sign_in

		expect(page).to have_content("Signed in as: toast@example.com")
	end
		
	scenario "User enters wrong password" do
		sign_up
		click_button "Sign out"
		
		visit "/sign_in"
		fill_in "Email", with: "toast@example.com"
		fill_in "Password", with: "12345678"
		click_button "Sign in"
		
		expect(page).to have_content("Bad email or password.")
	end

	scenario "User tries to access non-public page without login" do
		visit "/posts"		
		expect(current_path).to eq('/sign_in')
	end
end 