def registration
  visit "/users/new"
  fill_in "Firstname", with: "Test"
  fill_in "Lastname", with: "Example"
  fill_in "Email", with: "test@example.com"
  fill_in "Password", with: "password123"
  click_button "Submit"
end
