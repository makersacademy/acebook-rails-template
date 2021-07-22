require 'rails_helper'

RSpec.feature "User Sign Up", type: :feature do

  # Capybara can't pick up CSS so we can't check for unhappy paths
  scenario 'name is not submitted' do

    visit '/users/new'
    fill_in 'user_name', with: ' '
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: 'password123'
    fill_in 'user_password_confirmation', with: 'password123'

    expect(page).to have_current_path('/users/new')
  end

  scenario 'user email is not submitted' do

    visit '/users/new'
    fill_in 'user_name', with: 'TestName'
    fill_in 'user_email', with: ' '
    fill_in 'user_password', with: 'password123'
    fill_in 'user_password_confirmation', with: 'password123'

    expect(page).to have_current_path('/users/new')
  end

  scenario 'user email is submitted incorrectly' do

    visit '/users/new'
    fill_in 'user_name', with: 'TestName'
    fill_in 'user_email', with: 'failEmail.wrong'
    fill_in 'user_password', with: 'password123'
    fill_in 'user_password_confirmation', with: 'password123'

    expect(page).to have_current_path('/users/new')
  end

  scenario 'password is not submitted' do

    visit '/users/new'
    fill_in 'user_name', with: 'TestName'
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: ' '
    fill_in 'user_password_confirmation', with: ' '

    expect(page).to have_current_path('/users/new')
  end

  scenario 'passwords dont match' do

    visit '/users/new'
    fill_in 'user_name', with: 'TestName'
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: 'password123'
    fill_in 'user_password_confirmation', with: 'password321'

    expect(page).to have_current_path('/users/new')
  end

  # scenario 'Everything is done correctly' do

  #   visit '/users/new'
  #   fill_in 'user_name', with: 'TestName'
  #   fill_in 'user_email', with: 'testemail@test.com'
  #   fill_in 'user_password', with: 'password123'
  #   fill_in 'user_password_confirmation', with: 'password123'

  #   expect(page).to have_content('TestName')
  # end


end


