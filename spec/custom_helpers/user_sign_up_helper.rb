def user_sign_up(email = "codingatmakers@gmail.com", password = "password")
  visit "/users/sign_up"
  fill_in "Email", with: email
  fill_in "Password", with: password
  fill_in "Password confirmation", with: password
  click_button "Sign Up"
end

# visit "/users/sign_up"
# fill_in 'Email', with: email
# fill_in 'Password', with: password
# click_button 'Sign up'
