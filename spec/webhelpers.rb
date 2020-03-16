def sign_up(email, password)
  visit('/users/sign_up')
  fill_in "user_email", with: email
  fill_in "user_password", with: password
  click_button("Sign up")
end

