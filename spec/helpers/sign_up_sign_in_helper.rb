def sign_up(email, pass, conf_pass)

  visit new_user_registration_path
  fill_in "user_email", with: email
  fill_in "user_password", with: pass
  fill_in "user_password_confirmation", with: conf_pass
  click_button "Sign up"

end

def sign_in(email, pass)

  visit new_user_registration_path
  click_link "Log in"
  fill_in "user_email", with: email
  fill_in "user_password", with: pass
  click_on "Log in"
end
