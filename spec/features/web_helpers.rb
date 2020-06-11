def sign_up
  visit "/"
  click_link "Sign up"
  fill_in "email", with: "test@example.com"
  fill_in "password", with: "test1234"
  fill_in "password confirmation", with: "test1234"
  click_link "Sign up"
end