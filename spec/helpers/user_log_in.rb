def user_log_in
  visit "/login"
  fill_in "session_email", with: "new_user@email.com"
  fill_in "session_password", with: "Password123"
  click_button "Log in"
end

def incorrect_user_log_in
  visit "/login"
  fill_in "session_email", with: "wrong@gmail.com"
  fill_in "session_password", with: "travels"
  click_button "Log in"
end
