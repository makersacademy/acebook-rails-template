def signup
  visit "/welcome"
  click_button "Sign Up"
  fill_in "Name", with: "Bob"
  fill_in "Email", with: "bob@test.com"
  fill_in "Password", with: "Bobobob"
  click_button "Create User"
end