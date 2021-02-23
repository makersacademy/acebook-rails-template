def log_in
  visit "/login"
  fill_in "username", with: "testuser1"
  fill_in "password", with: "password"
  click_on "Log In"
end

def sign_up_and_in_new_user
  visit "/signup"
  fill_in "user_username", with: "testuser2"
  fill_in "user_password", with: "password"
  fill_in "user_password_confirmation", with: "password"
  click_on "Submit"
  visit "/login"
  fill_in "username", with: "testuser2"
  fill_in "password", with: "password"
  click_on "Log In"
end