def sign_up_steps
  click_link('Sign Up')
  fill_in "user_email", with: 'test@gmail.com'
  fill_in "user_password", with: 'test123'
  fill_in "user_password_confirmation", with: 'test123'
  click_button('Sign up')
end

# def sign_in_steps
#   click_link('Sign In')
#   fill_in "user_email", with: 'test@gmail.com'
#   fill_in "user_password", with: 'test123'
#   click_button('Log in')
# end

def submit_post
  visit "/posts"
  click_link "New post"
  fill_in "Message", with: "Hello, world!"
  click_button "Submit"
end
