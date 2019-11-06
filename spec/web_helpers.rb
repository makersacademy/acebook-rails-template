def create_user
  User.create(first_name: 'John', last_name: 'Doe', email: 'test@test.com', password: 'password')
end

def login_user
  visit "/"
  click_link "Log In"
  fill_in 'user[email]', with: 'test@test.com'
  fill_in 'user[password]', with: 'password'
  click_button 'Log in'
end
