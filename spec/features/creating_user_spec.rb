require 'rails_helper'

RSpec.feature 'User', type: :feature do
  scenario 'Can create a user and view them' do
    visit '/users/new'
    fill_in 'user[email]', with: 'test@test.com'
    fill_in 'user[password]', with: 'test1234'
    
    click_button 'Save User'
    expect(page).to have_content('test@test.com')
  end
end