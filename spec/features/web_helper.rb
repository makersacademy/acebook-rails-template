def sign_in_flaubert
  visit('/')
  fill_in 'user_first_name', with: 'Jack'
  fill_in 'user_last_name', with: 'Sparrow'
  fill_in 'user_email', with: 'js@test.com'
  fill_in 'user_password', with: 'foobar'
  fill_in 'user_password_confirmation', with: 'foobar'
  click_button 'Submit'
end