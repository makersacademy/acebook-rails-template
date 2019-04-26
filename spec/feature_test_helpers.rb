def sign_up
  visit 'users/sign_up'
  fill_in 'user_email', with: 'james@test.com'
  fill_in 'user_password', with: '123456'
  fill_in 'user_password_confirmation', with: '123456'
  click_button 'Sign up'
end  

def sign_up_2
  visit 'users/sign_up'
  fill_in 'user_email', with: 'tome@test.com'
  fill_in 'user_password', with: '123456'
  fill_in 'user_password_confirmation', with: '123456'
  click_button 'Sign up'
end

def post_message
  click_link 'New post'
  fill_in 'Message', with: 'Hello, World!'
  click_button 'Submit'
end

def sign_in
  visit '/users/sign_in'
  fill_in 'user_email', with: 'james@test.com'
  fill_in 'user_password', with: '123456'
  click_button 'Log in'
end
