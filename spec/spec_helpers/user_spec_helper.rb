def user_signup(username, email, full_name, password)
  visit "/"
  click_link "Sign Up"
  fill_in "user_username", with: username
  fill_in "user_full_name", with: full_name
  fill_in "user_email", with: email
  fill_in "user_password", with: password
  click_button "Sign up"
end

def user_login(username, password)
  click_link "Login"
  fill_in "username", with: username
  fill_in "password", with: password
  click_button "Login"
end