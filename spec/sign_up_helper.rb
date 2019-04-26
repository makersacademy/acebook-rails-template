def create_user_and_sign_up
  visit "/"

  fill_in("user_email", with: "georgie@com")
  fill_in("user_password", with: "password1")
  fill_in("user_password_confirmation", with: "password1")
  click_button("Sign up")
end
