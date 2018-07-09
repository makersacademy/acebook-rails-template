def create_user
  visit "/signup"
  fill_in "user_name", with: "Gulliver"
  fill_in "user_email", with: "gulliver@mail.com"
  fill_in "user_password", with: "travels"
  fill_in "user_password_confirmation", with: "travels"
  click_button "Create my account"
end

def create_user_with_empty_name
  visit "/signup"
  fill_in "user_name", with: ""
  fill_in "user_email", with: "gulliver@mail.com"
  fill_in "user_password", with: "travels"
  fill_in "user_password_confirmation", with: "travels"
  click_button "Create my account"
end

def create_user_with_non_matching_password
  visit "/signup"
  fill_in "user_name", with: "Gulliver"
  fill_in "user_email", with: "gulliver@mail.com"
  fill_in "user_password", with: "travels"
  fill_in "user_password_confirmation", with: "travelling"
  click_button "Create my account"
end
