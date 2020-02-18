def sign_up
  visit '/'
  click_button "Sign Up"
  fill_in "Email", with: "ben@gmail.com"
  fill_in "Password", with: "Password"
  click_button "create"
end

def log_in
  fill_in "Email", with: "ben@gmail.com"
  fill_in "Password", with: "Password"
  click_button "Log In"
end 