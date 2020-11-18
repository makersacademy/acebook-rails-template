def user_signup(username, email)
  visit "/"
  click_link "Sign Up"
  fill_in "user_username", with: username
  fill_in "user_full_name", with: "Arabella Knowles"
  fill_in "user_email", with: email
  fill_in "user_password", with: "makers4life"
  click_button "Submit"
end