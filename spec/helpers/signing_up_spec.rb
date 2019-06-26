def sign_up_user
  visit '/users/new'
  fill_in 'user_name', with: "Lisa"
  fill_in "user_email", with: "lisa@email.com"
  fill_in "user_password", with: "Password"
  fill_in "user_password_confirmation", with: "Password"
  click_button "Sign Up"
end

def sign_up_user_2
  visit '/users/new'
  fill_in 'user_name', with: "Yemi"
  fill_in "user_email", with: "yemi@email.com"
  fill_in "user_password", with: "Password"
  click_button "Sign Up"
end