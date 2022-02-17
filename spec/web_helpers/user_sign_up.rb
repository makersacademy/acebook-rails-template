def sign_up_user
  visit'/'
  fill_in 'Name', with: 'Amy Ace'
  fill_in 'Email', with: 'test@test.com'
  fill_in 'Password', with: '123456'
  fill_in 'Password confirmation', with: '123456'
  click_button 'Sign up'
end