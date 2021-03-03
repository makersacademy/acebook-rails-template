DEFAULT_EMAIL = "test@test.com"
DEFAULT_PASSWORD = "password"
DEFAULT_POST = "Hello, world!"
SECONDARY_EMAIL = "test2@test.com"
SECONDARY_PASSWORD = "password2"
SECONDARY_POST = "Goodbye, cruel world!"

def sign_up(email = DEFAULT_EMAIL, password = DEFAULT_PASSWORD)
  visit '/'
  click_button 'Sign up'
  fill_in 'user_email', with: email
  fill_in 'user_password', with: password
  fill_in 'user_password_confirmation', with: password
  click_button 'Sign up'
end

def sign_in(email = DEFAULT_EMAIL, password = DEFAULT_PASSWORD)
  fill_in 'inputEmail', with: email
  fill_in 'inputPassword', with: password
  click_button "Log in"
end

def create_post(post = DEFAULT_POST)
  click_link 'New post'
  fill_in 'Message', with: post
  click_button 'Submit'
  expect(page).to have_content(post)
end