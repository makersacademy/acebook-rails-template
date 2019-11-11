def create_user
  User.create(first_name: 'John', last_name: 'Doe', email: 'test@test.com', password: 'password', username: 'john')
end

def login_user
  visit "/"
  click_link "Log In"
  fill_in 'user[email]', with: 'test@test.com'
  fill_in 'user[password]', with: 'password'
  click_button 'Log in'
end

def logout_user
  click_link 'Log Out'
end

def create_user_two
  User.create(first_name: 'Jonny', last_name: 'Doe', email: 'test23@test.com', password: 'password', username: 'jonny')
end

def login_user_two
  visit "/"
  click_link "Log In"
  fill_in 'user[email]', with: 'test23@test.com'
  fill_in 'user[password]', with: 'password'
  click_button 'Log in'
end
