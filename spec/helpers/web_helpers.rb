def login
  visit '/'
  click_link 'Login'
  fill_in 'user_email', with: 'tests@mail.com'
  fill_in 'user_password', with: 'test123'
  click_button 'Log in'
end

def signup
  visit '/'
  click_link 'Sign Up'
  fill_in 'user_email', with: 'tests@mail.com'
  fill_in 'user_password', with: 'test123'
  fill_in 'user_password_confirmation', with: 'test123'
  click_button 'Sign up'
end

def logout
  signup
  click_link 'Logout'
end