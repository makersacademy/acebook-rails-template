# frozen_string_literal: true

def create_user
  User.create(username: 'HomerSimpson', email: 'test@test.com', password: 'password')
end

def login_user
  visit '/'
  click_link 'Login'
  fill_in 'user[email]', with: 'test@test.com'
  fill_in 'user[password]', with: 'password'
  click_button 'Log in'
end

def logout_user
  click_link 'Logout'
end

def create_user_two
  User.create(username: 'BartSimpson', email: 'test2@test.com', password: 'password')
end

def login_user_two
  visit '/'
  click_link 'Login'
  fill_in 'user[email]', with: 'test2@test.com'
  fill_in 'user[password]', with: 'password'
  click_button 'Log in'
end

def create_post
  click_link "New post"
  fill_in "Message", with: "Hello, world!"
  click_button "Submit"
end

def create_comment
  click_link "Show Comments ()"
  click_link "New Comment"
  fill_in 'comment[body]', with: 'A comment'
  click_button 'Post Comment'
end

def edit_comment
  click_link "Show Comments (1)"
  click_link 'Edit'
  fill_in 'comment[body]', with: 'An edited comment'
  click_button 'Modify Comment'
end

def delete_comment
  click_link "Delete"
  page.accept_alert
end
  
  
