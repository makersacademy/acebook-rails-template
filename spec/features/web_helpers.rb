def post_message(message)
  click_link "New post"
  fill_in "Message", with: message
  click_button "Submit"
end

def signup1
  visit('/')
  click_link('Register')
  fill_in(:user_name, with: "user1")
  fill_in(:user_email, with: "user1@test.com")
  fill_in(:user_password, with: "password1")
  fill_in(:user_password_confirmation, with: "password1")
  click_button 'Sign up'
end

def signup2
  visit('/')
  click_link('Register')
  fill_in(:user_name, with: "user2")
  fill_in(:user_email, with: "user2@test.com")
  fill_in(:user_password, with: "password1")
  fill_in(:user_password_confirmation, with: "password1")
  click_button 'Sign up'
end
