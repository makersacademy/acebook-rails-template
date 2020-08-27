def sign_up 
  visit '/users/new'
  fill_in "user[name]", with: "Test Johnson"
  fill_in "user[email]", with: "testjohnson@testmail.com"
  fill_in "user[password]", with: "1234"
  click_button 'Create User'
end