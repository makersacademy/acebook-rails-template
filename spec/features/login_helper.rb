def sign_up_user
  visit "/users/sign_up"
  fill_in "Email", with: "testemail@domain.com"
  fill_in "Password", with: "password1"
  fill_in "Password confirmation", with: "password1"
  click_button "Sign up"
end