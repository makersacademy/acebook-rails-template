def sign_up
  visit "/"
  click_link "Sign up"
  fill_in "Email", with: "Test123@test.com"
  fill_in "Password", with: "12345q"
  fill_in "Password confirmation", with: "12345q"
  click_button "Sign up"
end

def sign_in
  visit "/"
  fill_in "Email", with: "Test123@test.com"
  fill_in "Password", with: "12345q"
  click_button "Log in"
end
