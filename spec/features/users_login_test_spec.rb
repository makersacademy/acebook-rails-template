require 'rails_helper'

RSpec.feature "User Sign in", type: :feature do
	 scenario 'Login in without the correct password' do

 		visit '/signup'
    fill_in 'user_name', with: 'test'
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: 'password123'
    fill_in 'user_password_confirmation', with: 'password123'

 		visit '/login'
 		fill_in 'session_email', with: 'test@test.com'
 		fill_in 'session_password', with: 'password'

		expect(page).to have_current_path('/login')
  end
end
