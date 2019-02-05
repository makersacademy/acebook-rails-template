
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

def sign_up_bad_email
  click_link "Sign up"
  fill_in "user[email]", with: "testatemailwebsitedotcom"
  fill_in "user[password]", with: "testpassword"
  fill_in "user[password_confirmation]", with: "testpassword"
  click_button 'Sign up'
end

def sign_up_short_password
  click_link "Sign up"
  fill_in "user[email]", with: "test@test.com"
  fill_in "user[password]", with: "passw"
  fill_in "user[password_confirmation]", with: "passw"
  click_button 'Sign up'
end

def create_post
  visit "/posts"
  click_link "New post"
  fill_in "Message", with: "Hello, world!"
  click_button "Submit"
end
