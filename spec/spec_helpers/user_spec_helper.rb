def user_signup
  visit "/"
  click_link "Sign Up"
  fill_in "user_username", with: "arakno"
  fill_in "user_full_name", with: "Arabella Knowles"
  fill_in "user_email", with: "arakno@makers.com"
  fill_in "user_password", with: "makers4life"
  click_button "Submit"
end