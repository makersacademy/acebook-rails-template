def sign_up(email, password)
  visit('/users/sign_up')
  fill_in "user_email", with: email
  fill_in "user_password", with: password
  click_button("Sign up")
end

def login(email, password)
  User.create(name: 'Test Name', email: email, password: password)
    visit('/posts')
    fill_in "user_email", with: email
    fill_in "user_password", with: password
    click_button("Log in")
end 