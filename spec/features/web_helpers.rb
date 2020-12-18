def create_user_in_test_db
  User.create(
      username: 'Malachi',
      email: 'm.spencer@makers.com',
      password: '2020',
      password_confirmation: '2020'
    )
end