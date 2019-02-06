def sign_up(email, username, password)
  visit '/'
  click_on 'Sign up'
  fill_in "user_email", with: email
  fill_in "user_user_name", with: username
  fill_in "user_password", with: password
  fill_in "user_password_confirmation", with: password
  click_button 'Sign up'
end


 def log_in(email, password)
   visit '/'
   fill_in "user_email", with: email
   fill_in "user_password", with: password
   click_button 'Log in'
 end


def post_message(message)
  click_link "New post"
  fill_in "Message", with: message
  click_button "Submit"
end
