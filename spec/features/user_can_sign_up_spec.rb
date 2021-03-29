require 'rails_helper'

RSpec.feature "Register", type: :feature do
	scenario "Can click on sign up button" do
		visit "/posts"
		expect(page).to have_link("Sign Up")
	end

	scenario "Takes user to sign up page" do
		visit "/posts"
		click_link("Sign Up")
		expect(page).to have_content("Sign Up Page")
	end

	scenario "User can sign up" do
		visit "/users/sign_up"
		fill_in('user_email', with: 'test@test.com')
		fill_in('user_password', with: 'password')
		fill_in('user_password_confirmation', with: 'password')
		click_button('Sign up')
		expect(page).to have_content('Welcome! You have signed up successfully.')
	end

	scenario "User can sign in" do	
		visit "/users/sign_in"
		fill_in('user_email', with: 'test@test.com')
		fill_in('user_password', with: 'password')
		click_button('Log in')
		# expect(session[:user_id]).to_not be_nil
	end
end
