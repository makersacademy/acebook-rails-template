require 'rails_helper'

RSpec.feature 'User can edit their account', type: :feature do
  scenario 'Can edit their password on SCZL' do
    register
    click_link 'User Settings'
    fill_in 'Password', with: 'Test1234'
    fill_in 'Password confirmation', with: 'Test1234'
    fill_in 'Current password', with: 'Test123'
    click_button 'Update'
    expect(page).to have_content('Your account has been updated successfully.')
  end

  scenario 'Can edit their email on SCZL' do
    register
    click_link 'User Settings'
    fill_in 'Email', with: 'test1@test.com'
    fill_in 'Current password', with: 'Test123'
    click_button 'Update'
    expect(page).to have_content('Your account has been updated successfully.')
  end

  scenario 'Can edit their password & email on SCZL' do
    register
    click_link 'User Settings'
    fill_in 'Email', with: 'test1@test.com'
    fill_in 'Password', with: 'Test1234'
    fill_in 'Password confirmation', with: 'Test1234'
    fill_in 'Current password', with: 'Test123'
    click_button 'Update'
    expect(page).to have_content('Your account has been updated successfully.')
  end
end
