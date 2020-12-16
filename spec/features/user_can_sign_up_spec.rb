require 'rails_helper'


RSpec.feature 'User Registration', type: :feature do
  scenario 'Can register to use SCZL' do
    visit '/'
    click_link 'Register'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'Test123'
    fill_in 'Password confirmation', with: 'Test123'
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario "User can't register with the same email" do
    register
    click_link 'Sign Out'
    visit '/'
    register
    expect(page).to have_content('Email has already been taken')
  end
end
