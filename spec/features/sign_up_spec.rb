require 'rails_helper'

RSpec.feature "User Sign Up", type: :feature do

  # Capybara can't pick up CSS so we can't check for unhappy paths
  scenario 'name is not submitted' do

    visit '/signup'
    fill_in 'user_name', with: ' '
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: 'password123'
    fill_in 'user_password_confirmation', with: 'password123'
    click_button 'Create my account'

    expect(page).to have_current_path('/signup')
  end

  scenario 'user email is not submitted' do

    visit '/signup'
    fill_in 'user_name', with: 'TestName'
    fill_in 'user_email', with: ' '
    fill_in 'user_password', with: 'password123'
    fill_in 'user_password_confirmation', with: 'password123'
    click_button 'Create my account'

    expect(page).to have_current_path('/signup')
  end

  scenario 'user email is submitted incorrectly' do

    visit '/signup'
    fill_in 'user_name', with: 'TestName'
    fill_in 'user_email', with: 'failEmail.wrong'
    fill_in 'user_password', with: 'password123'
    fill_in 'user_password_confirmation', with: 'password123'
    click_button 'Create my account'

    expect(page).to have_current_path('/signup')
  end

  scenario 'password is not submitted' do

    visit '/signup'
    fill_in 'user_name', with: 'TestName'
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: ' '
    fill_in 'user_password_confirmation', with: ' '
    click_button 'Create my account'

    expect(page).to have_current_path('/signup')
  end

  scenario 'passwords dont match' do

    visit '/signup'
    fill_in 'user_name', with: 'TestName'
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: 'password123'
    fill_in 'user_password_confirmation', with: 'password321'
    click_button 'Create my account'

    expect(page).to have_current_path('/signup')
  end

  scenario 'Everything is done correctly' do

    visit '/users/new'
    fill_in 'user_name', with: 'TestName'
    fill_in 'user_email', with: 'testemail2@test.com'
    fill_in 'user_password', with: 'password123'
    fill_in 'user_password_confirmation', with: 'password123'
    click_button 'Create my account'

    expect(page).to have_current_path('/users')
  end

end
