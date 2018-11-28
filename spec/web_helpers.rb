# sign up, in and out methods

def visit_site_sign_up
  visit '/posts'
  click_link 'Sign Up'
  expect(page).to have_current_path("/users/sign_up")
  fill_in "user[username]", with: "username123"
  fill_in "user[email]", with: "user@user.com"
  fill_in "user[password]", with: "pword123"
  fill_in "user[password_confirmation]", with: "pword123"
  click_button "Sign up"
end

def sign_up_other_user
  visit '/posts'
  click_link 'Sign Up'
  fill_in "user[username]", with: "username1"
  fill_in "user[email]", with: "user1@user.com"
  fill_in "user[password]", with: "pword1"
  fill_in "user[password_confirmation]", with: "pword1"
  click_button "Sign up"
end

def sign_in_to_test(wrong_credentials = false)
  email = wrong_credentials ? "wrong@email.com" : "user@user.com"
  password = wrong_credentials ? "wrongpassword" : "pword123"
  visit '/posts'
  click_link "Sign In"
  fill_in "user[email]", with: email
  fill_in "user[password]", with: password
  click_button "Log in"
end

def sign_out
  visit '/'
  click_link "Log Out"
end

#posting actions

def hello_world_post
  visit "/posts"
  click_link "New Post"
  fill_in "Message", with: "Hello, world!"
  click_button "Submit"
end

def hello_world_timeline_post
  fill_in "post[message]", with: "Hello, world!"
  click_button "Submit"
end

def edit_post
  click_link "Edit"
  fill_in "Message", with: 'Goodbye, world!'
  click_button 'Update'
end
