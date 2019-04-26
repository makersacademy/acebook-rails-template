def sign_up_helper(username, password)
  visit "/users/new"
  fill_in 'user_email', with: username
  fill_in 'user_password', with: password
  click_button "Create my account"
end

def log_in_helper(username, password)
  visit "/login"
  fill_in 'session_email', with: username
  fill_in 'session_password', with: password
  click_button 'Log in'
end
