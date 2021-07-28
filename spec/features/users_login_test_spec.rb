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
		  click_on('Log in')

		  expect(page).to have_current_path('/login')
  end

	 scenario 'Login in without the correct user_email' do

 	  visit '/signup'
 	  fill_in 'user_name', with: 'test'
 	  fill_in 'user_email', with: 'test@test.com'
 	  fill_in 'user_password', with: 'password123'
 	  fill_in 'user_password_confirmation', with: 'password123'

 	  visit '/login'
 	  fill_in 'session_email', with: 'development@test.com'
 	  fill_in 'session_password', with: 'password'
 	  click_on('Log in')

 	  expect(page).to have_current_path('/login')
  end

  scenario 'Successful login' do

 	  visit '/login/new'
 	  fill_in 'user_name', with: 'test'
 	  fill_in 'user_email', with: 'test123@test.com'
 	  fill_in 'user_password', with: 'password123'
 	  fill_in 'user_password_confirmation', with: 'password123'

 	  click_on('Create my account')
 	# find_button('Create my account').click

 	# visit '/login'
 	# fill_in 'session_email', with: 'test@test.com'
 	# fill_in 'session_password', with: 'password123'
 	  expect(page).to have_current_path('/users')
  end

	 scenario 'Login in without the correct user_email' do

 	  visit '/signup'
 	  fill_in 'user_name', with: 'test'
 	  fill_in 'user_email', with: 'test@test.com'
 	  fill_in 'user_password', with: 'password123'
 	  fill_in 'user_password_confirmation', with: 'password123'

 	  visit '/login'
 	  fill_in 'session_email', with: 'development@test.com'
 	  fill_in 'session_password', with: 'password'
 	  click_on('Log in')

 	  expect(page).to have_current_path('/login')
  end

  scenario 'Successful login' do

 	  visit '/login/new'
 	  fill_in 'user_name', with: 'test'
 	  fill_in 'user_email', with: 'test123@test.com'
 	  fill_in 'user_password', with: 'password123'
 	  fill_in 'user_password_confirmation', with: 'password123'

 	  click_on('Create my account')
 	# find_button('Create my account').click

 	# visit '/login'
 	# fill_in 'session_email', with: 'test@test.com'
 	# fill_in 'session_password', with: 'password123'
 	  expect(page).to have_current_path('/users')
  end

	scenario 'Login in without the correct user_email' do

	 visit '/signup'
	 fill_in 'user_name', with: 'test'
	 fill_in 'user_email', with: 'test@test.com'
	 fill_in 'user_password', with: 'password123'
	 fill_in 'user_password_confirmation', with: 'password123'

	 visit '/login'
	 fill_in 'session_email', with: 'development@test.com'
	 fill_in 'session_password', with: 'password'
	 click_on('Log in')

	 expect(page).to have_current_path('/login')
 end

 scenario 'Successful login' do

	visit '/signup'
	fill_in 'user_name', with: 'test'
	fill_in 'user_email', with: 'test@test.com'
	fill_in 'user_password', with: 'password123'
	fill_in 'user_password_confirmation', with: 'password123'

	# click_on('Create my account')
	find_button('Create my account').click

	# visit '/login'
	# fill_in 'session_email', with: 'test@test.com'
	# fill_in 'session_password', with: 'password123'
	expect(page).to have_current_path('/users')
end
end
