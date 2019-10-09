def signup(email, password)
  visit "/"
  click_link "Register"
  fill_in "user[email]", with: "#{email}"
  fill_in "user[password]", with: "#{password}"
  click_button('Submit')
end