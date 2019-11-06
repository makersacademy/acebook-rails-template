# frozen_string_literal: true

def create_user
  User.create(user_name: 'HomerSimpson', email: 'test@test.com', password: 'password')
end

def login_user
  visit '/'
  click_link 'Login'
  fill_in 'user[email]', with: 'test@test.com'
  fill_in 'user[password]', with: 'password'
  click_button 'Log in'
end
