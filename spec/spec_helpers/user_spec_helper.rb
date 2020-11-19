def user_signup(username, email, full_name, password)
  visit "/"
  click_link "Sign Up"
  fill_in "user_username", with: username
  fill_in "user_full_name", with: full_name
  fill_in "user_email", with: email
  fill_in "user_password_digest", with: password
  click_button "Sign up"
end