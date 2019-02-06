# frozen_string_literal: true
def signup_and_click
  visit '/signup'
  fill_in 'users_username', with: 'Test 001'
  fill_in 'users_email', with: 'Test100@test.com'
  fill_in 'users_password', with: 'Password001'
  find('input[name="commit"]').click
end

def second_user_signup_and_click
  visit '/signup'
  fill_in 'users_username', with: 'Test 002'
  fill_in 'users_email', with: 'Test200@test.com'
  fill_in 'users_password', with: 'Password002'
  find('input[name="commit"]').click
end