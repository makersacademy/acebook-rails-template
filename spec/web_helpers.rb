# frozen_string_literal: true

def create_user
  User.create(username: 'HomerSimpson', email: 'test@test.com', password: 'password', id: 1)
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
  User.create(username: 'BartSimpson', email: 'test2@test.com', password: 'password', id: 2)
end

def login_user_two
  visit '/'
  click_link 'Login'
  fill_in 'user[email]', with: 'test2@test.com'
  fill_in 'user[password]', with: 'password'
  click_button 'Log in'
end

def create_post
  visit '/users/1'
  fill_in 'post[message]', with: "Hello, world!"
  click_button "Post"
end

def create_comment
  fill_in 'comment[body]', with: 'A comment'
  click_button "Add Comment"
end

def edit_comment
  click_link "Edit comment"
  fill_in 'comment[body]', with: 'An edited comment'
  click_button 'Edit'
end

def delete_comment
  click_link "Delete comment"
end
