
def go_homepage
  visit '/'
end


def sign_up
  click_link "Sign up"
  fill_in "user[email]", with: "test@test.com"
  fill_in "user[password]", with: "testpassword"
  fill_in "user[password_confirmation]", with: "testpassword"
  click_button 'Sign up'
end
