def user_sign_up
  visit "/users/sign_up"
  fill_in "Name", with: "John"
  fill_in "Email", with: "codingatmakers@gmail.com"
  fill_in "Password", with: "password"
  fill_in "Password confirmation", with: "password"
  click_button "Sign up"
end
