def signup
  visit "/signup"
  fill_in "Name", with: "Ben"
  fill_in "Email", with: "ben@example.com"
  fill_in "Password", with: "123456"
  fill_in "Confirm Password", with: "123456"
  click_button "Sign up"
end

def login
  visit "/login"
  fill_in "Email", with: "ben@example.com"
  fill_in "Password", with: "123456"
  click_button "Log in"
end
