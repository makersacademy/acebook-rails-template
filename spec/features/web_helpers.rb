def create_user_in_test_db
  User.create(
      username: 'Malachi',
      email: 'm.spencer@makers.com',
      password: '2020',
      password_confirmation: '2020'
    )
end

def login_successfully
  visit('/sessions/new')

  fill_in('email', with: 'm.spencer@makers.com')
  fill_in('password', with: '2020')
  click_button('Sign In')
end