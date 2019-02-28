def create_test_user_1
  User.create(email: "testuser@makers.com", first_name: "test", last_name: "user", password: "abc123")
end

def log_in_test_user_1
  visit("/users/sign_in")
  fill_in :user_email, with: 'testuser@makers.com'
  fill_in :user_password, with: 'abc123'
  click_button 'Log in'
end
