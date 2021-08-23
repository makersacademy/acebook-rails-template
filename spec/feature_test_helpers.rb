def user_sign_up
  visit "/users/sign_up"
  fill_in "user_username", with: "Bob"
  fill_in "user_email", with: "bob@example.com"
  fill_in "user_password", with: "password1!"
  fill_in "user_password_confirmation", with: "password1!"
  click_button "Sign up"
end

def user_log_in
  visit "/users/sign_in"
  fill_in "user_email", with: "bob@example.com"
  fill_in "user_password", with: "password1!"
  click_button "Log in"
end
