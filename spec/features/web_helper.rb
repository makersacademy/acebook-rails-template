def create_user
  visit ('/')
  click_link("Sign up", match: :first)
  fill_in "Username", with: "Kate"
  fill_in "Email", with: "email@mail.com"
  fill_in "Password", with: "password"
  fill_in "Password confirmation", with: "password"
  click_button "Sign up"
end

def create_user2
  visit ('/')
  click_link("Sign up", match: :first)
  fill_in "Username", with: "Maria"
  fill_in "Email", with: "email2@mail.com"
  fill_in "Password", with: "password2"
  fill_in "Password confirmation", with: "password2"
  click_button "Sign up"
end
