
def sign_up
  visit '/'
  click_button 'Sign up'
  fill_in 'user_email', with: 'anna.cavalla@gmail.com'
  fill_in 'user_password', with: 'password'
  fill_in 'user_password_confirmation', with: 'password'
  click_button 'Sign up'
end
