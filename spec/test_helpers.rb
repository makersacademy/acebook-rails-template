def sign_up(email = 'myemail@hotmail.com', password = 'password')
  visit '/'
  fill_in 'user[email_address]', with: email
  fill_in 'user[password]', with: password
  click_button 'Sign up'
end
