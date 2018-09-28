def sign_up
  fill_in 'user[email]', with: 'test@test.com'
  fill_in 'user[password]', with: 'tester'
  fill_in 'user[password_confirmation]', with: 'tester'
  click_on 'Sign up'
end
