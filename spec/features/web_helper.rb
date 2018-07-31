def successful_sign_up
  visit "/users/new"
  fill_in 'First name', with: "Elishka"
  fill_in 'Last name', with: "Flint"
  fill_in 'Email', with: "elishka@keepingitrails.com"
  fill_in 'Password', with: "pa55w0rd"
  click_button "Sign Up"
end
