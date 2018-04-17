def sign_up(email = "test@test.com", username = "test")
  visit "/users/sign_up"
  fill_in "user[email]", with: email
  fill_in "user[username]", with: username
  fill_in "user[password]", with: "testtest"
  fill_in "user[password_confirmation]", with: "testtest"
  click_button "Sign up"
end

def add_post(message = "Hello, world!")
  click_link "New post"
  fill_in "Message", with: message
  click_button "Submit"
end

def create_user_2
  User.create(email: "test2@test.com",  password: "testtest", password_confirmation: "testtest")
end

def create_user_3
  User.create(email: "test3@test.com", password: "testtest", password_confirmation: "testtest")
end

def sign_in_user_2
  visit "/users/sign_in"
  fill_in "user[email]", with: "test2@test.com"
  fill_in "user[password]", with: "testtest"
  click_button "Log in"
end

def sign_in_user_3
  visit "/users/sign_in"
  fill_in "user[email]", with: "test3@test.com"
  fill_in "user[password]", with: "testtest"
  click_button "Log in"
end
