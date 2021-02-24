require 'rails_helper'

RSpec.feature 'Sign-Up', type: :feature do 
  scenario 'Can sign up to BBB Acebook' do 
  visit '/'
  click_link 'Register'
  expect(page).to have_current_path('/users/sign_up')
  fill_in 'Name', with: "Katy Day"
  fill_in 'Username', with: "Katy_the_Magnificent"
  fill_in 'Email', with: 'email@example.com'
  fill_in 'Password', with: 'password123'
  fill_in 'Password confirmation', with: 'password123'
  click_button 'Sign up'
  have_link 'Log in'
  expect(page).to have_current_path('/')
  expect(page).to have_content("Hello, Katy")

  end
end

=begin  Visit the homepage, there will be a welcome sign 
and a button that says 'sign up'.
You can click on the button, which will take you to /users/create
and then there will be a form for name, username, email, password and password confirmation,
and a button that says 'sign up', with a link that says 'Log in' - signing up
then redirects to index page with welcome banner that says
"Welcome, #{user}"
=end