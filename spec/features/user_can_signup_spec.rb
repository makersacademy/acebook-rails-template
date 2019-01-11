require 'rails_helper'

RSpec.feature "Signup", type: :feature do

	scenario "User can signup" do
		visit '/'
		all('a', :text => 'Sign up')[1].click
		fill_in "user[username]", with: "John"
		fill_in "user[firstname]", with: "John"
		fill_in "user[lastname]", with: "John"
		fill_in "user[birthday]", with: "01/01/1900"
		fill_in "user[email]", with: "John@gmail.com"
		fill_in "user[password]", with: "password"
		fill_in "user[password_confirmation]", with: "password"
		click_button "Sign up"
		
		expect(page).to have_content "Welcome! You have signed up successfully."
  end

end
