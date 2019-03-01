def create_test_user_1
  User.create(email: "testuser@makers.com", first_name: "test", last_name: "user", password: "abc123")
end

def sign_up_test_user_1
  visit '/'
  click_link("Sign up", match: :first)
  fill_in "user_email", with: "featuretest@email.com"
  fill_in "user_first_name", with: 'First'
  fill_in "user_last_name", with: 'Last'
  fill_in "user_password", with: "featurepwd"
  fill_in 'user_password_confirmation', with: "featurepwd"
  click_on "Submit"
  expect(page).to have_content('Logged in')
end

def log_in_test_user_1
  visit("/users/sign_in")
  fill_in :user_email, with: 'testuser@makers.com'
  fill_in :user_password, with: 'abc123'
  click_button 'Log in'
end
