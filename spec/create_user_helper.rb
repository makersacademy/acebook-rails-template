def create_new_user
  visit "/"
  fill_in "user[first_name]", with: "Some"
  fill_in "user[last_name]", with: "Person"
  fill_in "user[email]", with: "email@email.com"
  fill_in "user[password]", with: "123456"
  fill_in "user[password_confirmation]", with: "123456"
  click_button "Create User"
end
