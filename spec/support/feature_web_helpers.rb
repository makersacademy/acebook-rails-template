def fill_in_signup_form_and_submit
<<<<<<< HEAD
=======
  fill_in "user_first_name", with: 'first name'
  fill_in "user_last_name", with: 'last name'
  fill_in "user_email", with: 'test@email.com'
  fill_in "user_password", with: 'password'
  fill_in "user_password_confirmation", with: 'password'
  click_button "Sign up"
end

def signup
  visit "/"
  click_link "Signup"
>>>>>>> 3e92e935bdbf0d8b2b45858494cb00203afaf672
  fill_in "user_first_name", with: 'first name'
  fill_in "user_last_name", with: 'last name'
  fill_in "user_email", with: 'test@email.com'
  fill_in "user_password", with: 'password'
  fill_in "user_password_confirmation", with: 'password'
  click_button "Sign up"
end

def post_hello_world_message
  click_link "New Post"
  fill_in "Message", with: "Hello, world!"
  click_button "Submit"
end

def fill_in_login_form_and_submit
  fill_in "user_email", with: 'test@email.com'
  fill_in "user_password", with: "password"
  click_button "Log in"
end
