DEFAULT_EMAIL = "test@test.com"
DEFAULT_PASSWORD = "password"

def sign_up
  visit '/'
  click_button 'Sign up'
  fill_in 'user_email', with: DEFAULT_EMAIL
  fill_in 'user_password', with: DEFAULT_PASSWORD
  fill_in 'user_password_confirmation', with: DEFAULT_PASSWORD
  click_button 'Sign up'
end

def sign_in
  fill_in 'inputEmail', with: DEFAULT_EMAIL
  fill_in 'inputPassword', with: DEFAULT_PASSWORD
  click_button "Log in"
end