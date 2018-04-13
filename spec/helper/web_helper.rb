def sign_up
  visit "/users/sign_up"
  fill_in "user[email]", with: "test@test.com"
  fill_in "user[password]", with: "testtest"
  fill_in "user[password_confirmation]", with: "testtest"
  click_button "Sign up"
end

def add_post(message = "Hello, world!")
  click_link "New post"
  fill_in "Message", with: message
  click_button "Submit"
end
