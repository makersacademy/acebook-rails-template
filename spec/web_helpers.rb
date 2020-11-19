def add_new_user(name = "Test Person", email = "test@testing.com")
  visit "/users/new"
  fill_in "user_name", with: name
  fill_in "user_email", with: email
  fill_in "user_password", with: "test1234"
  fill_in "user_password_confirmation", with: "test1234"
  click_button "submit_sign_up"
end