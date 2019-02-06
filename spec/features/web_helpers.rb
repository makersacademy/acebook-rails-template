# frozen_string_literal: true

def signup_and_click
  visit '/signup'
  fill_in 'users_username', with: '1'
  fill_in 'users_email', with: 'Test100@test.com'
  fill_in 'users_password', with: '12345'
  find('input[name="commit"]').click
end

def second_user_signup_and_click
  visit '/signup'
  fill_in 'users_username', with: 'Test 002'
  fill_in 'users_email', with: 'Test200@test.com'
  fill_in 'users_password', with: 'Password002'
  find('input[name="commit"]').click
end

def login
  click_link 'Log In!'
  fill_in 'session_email', with: 'Test100@test.com'
  fill_in 'session_password', with: '12345'
  find('input[name="commit"]').click
end

def login_with_wrong_email
  click_link 'Log In!'
  fill_in 'session_email', with: 'test200@test.com'
  fill_in 'session_password', with: '12345'
  find('input[name="commit"]').click
end

def login_with_wrong_case_sensitive_details
  click_link 'Log In!'
  fill_in 'session_email', with: 'test100@test.com'
  fill_in 'session_password', with: '12345'
  find('input[name="commit"]').click
end

def login_with_wrong_password
  click_link 'Log In!'
  fill_in 'session_email', with: 'test100@test.com'
  fill_in 'session_password', with: '012345'
  find('input[name="commit"]').click
end

def logout
  click_on 'Log Out'
end

def signup_without_email
  visit '/signup'
  fill_in 'users_username', with: 'Test 001'
  fill_in 'users_password', with: 'Password001'
  find('input[name="commit"]').click
end

def signup_with_4_character_password
  visit '/signup'
  fill_in 'users_username', with: 'Test 001'
  fill_in 'users_email', with: 'test0001@makers.com'
  fill_in 'users_password', with: 'Pass'
  find('input[name="commit"]').click
end

def signup_twice_with_the_same_email
  visit '/signup'
  fill_in 'users_username', with: 'Test A'
  fill_in 'users_email', with: 'TestA@test.com'
  fill_in 'users_password', with: 'Password001'
  find('input[name="commit"]').click
  visit '/signup'
  fill_in 'users_username', with: 'Test 003'
  fill_in 'users_email', with: 'TestA@test.com'
  fill_in 'users_password', with: 'Password003'
  find('input[name="commit"]').click
end
