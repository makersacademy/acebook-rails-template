def sign_up_and_login
  visit "/users/new"
  fill_in "First name", with: "John"
  fill_in "Last name", with: "Doe"
  fill_in "Email", with: "john@doe.com"
  fill_in "Password", with: "john1234"
  click_button 'Submit'
  fill_in "Email", with: "john@doe.com"
  fill_in "Password", with: "john1234"
  click_button 'Submit'
end
