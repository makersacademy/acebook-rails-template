require 'rails_helper'

RSpec.feature "Register", type: :feature do
	scenario "Can click on sign up button" do
		visit "/posts"
		expect(page).to have_button("Sign Up")
	end

	scenario "Takes user to sign up page" do
		visit "/posts"
		click_button("Sign Up")
		expect.(page).to have_content("Sign Up Page")
	end
end
