def sign_up(email, pass, conf_pass)

  visit new_user_registration_path 
  fill_in "user_email", with: email
  fill_in "user_password", with: pass
  fill_in "user_password_confirmation", with: conf_pass
  click_button "Sign up"

end