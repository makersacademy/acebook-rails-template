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

def login_and_make_post
  create_user_in_test_db
  login_successfully

  click_link('New post')

  fill_in('post_body', with: '2021 will be a good year')

  click_button('Create Post')
end