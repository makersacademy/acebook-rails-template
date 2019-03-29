def sign_up_bob
  user_email = "bob@bob.com"
  user_password = "1234567890"
  visit "/"
  click_link "Sign up"
  fill_in "Email", with: user_email
  fill_in "Password", with: user_password
  fill_in "Password confirmation", with: user_password
  click_button "Sign up" 
end
