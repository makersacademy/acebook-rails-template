def create_new_user
  visit "/"
  fill_in "first_name", with: "Some"
  fill_in "last_name", with: "Person"
  fill_in "email", with: "email@email.com"
  fill_in "password", with: "123456"
  fill_in "password_confirmation", with: "123456"
  click_button "Create User"
end
