def sign_up(email = 'myemail@hotmail.com', password = 'password')
  visit '/'
  fill_in 'Email address', with: email
  fill_in 'Password', with: password
  click_button 'Sign up'
end
