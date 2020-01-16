def signup
  visit "/signup"
  fill_in "Name", with: "Ben"
  fill_in "Email", with: "ben@gmail.com"
  fill_in "Password", with: "1234"
  fill_in "Confirm Password", with: "1234"
  click_button "Sign up"
end

def login
  visit "/login"
  fill_in "Email", with: "ben@gmail.com"
  fill_in "Password", with: "1234"
  click_button "Log in"
end

def signup_user(name, email, password)
  click_on "sign_up"
  fill_in "Name", with: name
  fill_in "Email", with: email
  fill_in "Password", with: password
  fill_in "Confirm Password", with: password
  click_button "Sign up"
end
