
def sign_up
  visit "users/sign_up"
  fill_in "user[email]", with: "zizidwengy@email.com"
  fill_in "user[password]", with: "harrybest"
  fill_in "user[password_confirmation]", with: "harrybest"
  click_button "Sign up"
end
