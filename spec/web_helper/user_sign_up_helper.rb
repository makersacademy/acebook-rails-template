def user_sign_up(email = "testing@test.com", password = "password")
  visit "/users/sign_up"
  fill_in "Email", with: email
  fill_in "Password", with: password
  click_button "Sign up"
end
