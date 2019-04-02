def create_user
  visit ('/')
  click_link("Sign up", match: :first)
  fill_in "Username", with: "Kate"
  fill_in "Email", with: "email@mail.com"
  fill_in "Password", with: "password"
  fill_in "Password confirmation", with: "password"
  click_button "Sign up"
end
