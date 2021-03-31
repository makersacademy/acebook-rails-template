def sign_up_helper
  fill_in "Name", with: "Lizard Lizardson"
  fill_in "Email", with: "totally_lizard@example.com"
  fill_in "Password", with: "lizzalizz"
  fill_in "Confirmation", with: "lizzalizz"
  click_button "Create my account"
end
