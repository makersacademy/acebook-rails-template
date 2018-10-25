def create_post(message)
  visit '/posts'
  click_link 'Create post'
  fill_in 'Message', with: message
  click_button 'Submit'
end

def sign_up_helper
  visit('/users/sign_up')
  fill_in('user_email', with: 'test@email.com')
  fill_in('user_name', with: 'Test')
  fill_in('user_password', with: 'Testing123')
  fill_in('user_password_confirmation', with: 'Testing123')
  click_button('Sign up')
end

def log_in(email, password)
  fill_in('user_email', with: email)
  fill_in('user_password', with: password)
  click_button('Log in')
end
