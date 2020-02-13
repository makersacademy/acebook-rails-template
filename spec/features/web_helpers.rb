def sign_up
  visit "/"
  click_link "Sign Up"
  fill_in "Email", with: "cats@cats.com"
  fill_in "Password", with: "cats1234"
  fill_in "Password confirmation", with: "cats1234"
  click_button "Sign Up"
end