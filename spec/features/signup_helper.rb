def signup(email, password)
  visit "/"
  first(:link, "Register").click
  fill_in "user[email]", with: "#{email}"
  fill_in "user[password]", with: "#{password}"
  click_button('Submit')
end