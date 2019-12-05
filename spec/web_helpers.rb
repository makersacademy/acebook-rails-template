def sign_up
  visit "/"
  click_button "Sign Up"
  fill_in "Email", with: "gandalf@middleearth.org"
  fill_in "Password", with: "shadowfangs"
  fill_in "Password confirmation", with: "shadowfangs"
  fill_in "First name", with: "Gandalf"
  fill_in "Surname", with: "The Grey"
  click_button "Sign up"
end
