def sign_up(email, password)
  visit '/'
  click_on 'Signup'
  fill_in "user_email", with: email
  fill_in "user_password", with: password
  fill_in "user_password_confirmation", with: password
  click_button 'Sign up'
end


 def log_in(email, password)
   click_on 'Login'
   fill_in "user_email", with: email
   fill_in "user_password", with: password
   click_button 'Log in'
 end
