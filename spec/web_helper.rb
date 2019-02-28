def sign_up
  visit "/"
  click_link "Sign up"
  fill_in "First name", with: "Test"
  fill_in "Last name", with: "Test"
  fill_in "Pronoun", with: "she"
  fill_in "Email", with: "asd@dsa"
  fill_in "Password", with: "123456"
  fill_in "Password confirmation", with: "123456"
  click_button "Sign up"
end
