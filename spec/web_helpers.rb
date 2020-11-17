def add_new_user
  visit "/users/new"
  fill_in "user_name", with: "Test Person"
  fill_in "user_email", with: "test@testing.com"
  fill_in "user_password", with: "test1234"
  fill_in "user_password_confirmation", with: "test1234"
  click_button "submit_sign_up"
end