require 'rails_helper'

RSpec.feature 'User', type: :feature do

  scenario 'Can create a user and view own wall' do
    register_user
    expect(page).to have_content('Welcome to your wall, Test')
  end

  scenario 'Returns error if no name input' do
    register_user('test@test.com', 'test', '')
    expect(page).to have_content("Name can't be blank")
  end

  scenario 'Returns error if invalid email' do
    register_user('abademail')
    expect(page).to have_content('Seamail is invalid')
  end

  scenario 'Returns error if email has already been used' do
    register_user
    register_user
    expect(page).to have_content('Seamail has already been taken')
  end

  scenario 'Returns error if invalid password' do
    register_user('test@test.com', 'test')
    expect(page).to have_content("Password in fincorrect format - please enter 6-10 characters")
  end

end
