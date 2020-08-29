def create_user
  visit '/users/new'
  fill_in('first_name', with: 'test')
  fill_in('last_name', with: 'test_last_name')
  fill_in('email', with: 'test@test.com')
  fill_in('password', with: '123123')
  fill_in('password_confirmation', with: '123123')
  click_button('Create User')
end

def user_login
  visit '/login'
  fill_in('email', with: 'test@test.com')
  fill_in('password', with: '123123')
  click_button 'Login'
end
