def sign_up
  visit "/users/sign_up"
  fill_in "user_name", with: "Wendy Wendy"
  fill_in "user_email", with: "wendy@wendy.com"
  fill_in "user_password", with: "WendyWendy"
  fill_in "user_password_confirmation", with: "WendyWendy"
  click_button "Sign up"
end

def sign_in
  sign_up
  click_link "Sign Out"
  visit "/users/sign_in"
  fill_in "user_email", with: "wendy@wendy.com"
  fill_in "user_password", with: "WendyWendy"
  click_button 'Log in'
end
