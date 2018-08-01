def successful_sign_up
  visit "/users/new"
  fill_in 'First name', with: "test_first_name"
  fill_in 'Last name', with: "test_last_name"
  fill_in 'Email', with: "test_email@keepingitrails.com"
  fill_in 'Password', with: "pa55w0rd"
  click_button "Sign Up"
end

def successful_log_in
  visit "/"
  fill_in :email, with: "test_email@keepingitrails.com"
  fill_in :password, with: "pa55w0rd"
  click_button "Log In"
  expect(page).to have_content("Welcome test_first_name")
end
