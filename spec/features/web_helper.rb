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

def my_user_id(email)
  @my_user = User.find_by({ email: email })
  @my_user = @my_user[:id].to_s
  return @my_user
end

def signup_user(name, email, password)
  click_on "sign_up"
  fill_in "Name", with: name
  fill_in "Email", with: email
  fill_in "Password", with: password
  fill_in "Confirm Password", with: password
  click_button "Sign up"
end
