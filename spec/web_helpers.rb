def sign_up_steps
  visit "/"
  click_link('Sign Up')
  fill_in "user_email", with: 'test@gmail.com'
  fill_in "user_password", with: 'test123'
  fill_in "user_password_confirmation", with: 'test123'
  click_button('Sign up')
end  

def sign_in_steps
  visit "/"
  click_link('Sign In')
  fill_in "user_email", with: 'test@gmail.com'
  fill_in "user_password", with: 'test123'
  click_button('Log in')
end