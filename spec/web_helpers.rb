def sign_up
  visit '/'
  click_button('Sign Up')
  fill_in "email", with: "test@email.com"
  fill_in "password", with: "1234567"
  click_button("Create Account")
  click_link("See All Posts")
end

def login
  sign_up
  visit '/'
  click_button('Login')
  fill_in "email", with: "test@email.com"
  fill_in "password", with: "1234567"
  click_button("Login")
  click_link("See All Posts")
end
