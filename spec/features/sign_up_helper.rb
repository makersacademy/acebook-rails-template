def registration
  visit "/users/new"
  p fill_in "user[firstname]", with: "Test"
  fill_in "user[lastname]", with: "Example"
  fill_in "user[email]", with: "test@example.com"
  fill_in "user[password]", with: "password"
  click_button "Submit"
end
