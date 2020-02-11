def sign_up
  visit('/')
  click_link('Sign Up')
  fill_in 'user[email]', with: 'umberto@acebook.com'
  fill_in 'user[password]', with: 'password'
  click_button 'Save User'
end
