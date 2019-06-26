def sign_in_user
  click_button "Sign In"
  fill_in "email", with: "lisa@email.com"
  fill_in "password", with: "Password"
  click_button "Sign In"
end

def sign_in_another_user
  visit '/sessions/new'
  click_button "Sign In"
  fill_in "email", with: "test@test.com"
  fill_in "password", with: "Password"
  click_button "Sign In"
end
