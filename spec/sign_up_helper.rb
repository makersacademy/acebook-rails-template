def create_user_and_sign_up
  visit "/"
  fill_in("user_email", with: "georgie@com")
  fill_in("user_password", with: "password1")
  fill_in("user_password_confirmation", with: "password1")
  click_button("Sign up")
end

def create_second_user_and_sign_in
  visit "/"
  fill_in("user_email", with: "evelyn@com")
  fill_in("user_password", with: "password2")
  fill_in("user_password_confirmation", with: "password2")
  click_button("Sign up")
end
