def user_log_in(email = "testing@test.com", password = "password")
  visit "/users/sign_in"
  fill_in "Email", with: email
  fill_in "Password", with: password
  click_button "Log in"
end
