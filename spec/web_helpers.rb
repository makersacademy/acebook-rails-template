def create_post
  visit "/"
  click_link "New Post"
  fill_in "Message", with: "Hello, world!"
  click_button "Submit"
end

def sign_up_and_log_in
  visit "/"
  click_link "Sign Up"
  fill_in "Name", with: "Testyman"
  fill_in "Email", with: "testyman@test.com"
  fill_in "Password", with: "password123"
  fill_in "Password confirmation", with: "password123"
  click_button "Sign up"
end
