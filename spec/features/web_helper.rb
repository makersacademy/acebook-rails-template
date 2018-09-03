def sign_up_jackbert
  visit '/users/sign_up'
  fill_in 'First name', with: 'Jack'
  fill_in 'Last name', with: 'Sparrow'
  fill_in 'Email', with: 'js@test.com'
  fill_in 'user_password', with: 'foobar'
  fill_in 'user_password_confirmation', with: 'foobar'
  click_button 'Sign up'
end
