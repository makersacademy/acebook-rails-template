def create_post(message)
  visit '/posts'
  click_link 'Create post'
  fill_in 'Message', with: message
  click_button 'Submit'
end

def sign_in_helper
  visit('/')
  fill_in('user_email', with: 'test@email.com')
  fill_in('user_password', with: 'Testing123')
  click_button('Log in')
end
