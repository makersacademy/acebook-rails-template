# puts "users_helper.rb"

def signup_login
  visit "/welcome"
  click_link "Sign Up"
  fill_in "Username", with: "jooomin"
  fill_in "Password", with: "123"
  click_button "Create User"
  click_link "Login"
  fill_in "Username", with: "jooomin"
  fill_in "Password", with: "123"
  click_button "Login"
end

def visit_home_create_post
  # visit "/"
  click_link "New post"
  fill_in "Message", with: "Hello, world!"
  click_button "Submit"
  click_link "Hello, world!"
  # expect(page).to have_content("Hello, world!")
end