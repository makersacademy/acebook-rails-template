def create_user_and_sign_up
  visit "/"
  click_link "Sign up"

  fill_in("user_email", with: "georgie@com")
  fill_in("user_password", with: "password123")
  fill_in("user_password_confirmation", with: "password123")
  click_button("Sign up")
end