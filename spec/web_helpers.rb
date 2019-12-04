def sign_up
  visit "/"
  click_button "Sign Up"
  fill_in "Email", with: "gandolf@middleearth.org"
  fill_in "Password", with: "shadowfax"
  fill_in "Password confirmation", with: "shadowfax"
  fill_in "First name", with: "Gandalf"
  fill_in "Surname", with: "The Grey"
  click_button "Sign up"
end
