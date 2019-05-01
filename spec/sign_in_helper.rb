def first_user_sign_in
  click_link("Log in")
  fill_in("user_email", with: "georgie@com")
  fill_in("user_password", with: "password1")
  click_button("Log in")
end
