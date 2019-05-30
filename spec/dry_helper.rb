def create_user_test_email_dot_com_1234567
  fill_in "Username", with: "testName"
  fill_in "Email", with: "test@email.com"
  fill_in "Password", with: "1234567"
  fill_in "Confirm password", with: "1234567"
  click_button "Create an account"
end
