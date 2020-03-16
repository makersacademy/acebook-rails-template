# sign up web helper here

def sign_up
  visit("/")
  fill_in "Email", with: "test@example.com"
  fill_in "Password", with: "password"
  click_button "Submit"
end
