require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'User can sign_up' do
    visit '/'
    click_link 'Sign up'
    fill_in 'Username', with: 'BruceBatman'
    fill_in 'First name', with: 'Bruce'
    fill_in 'Surname', with: 'Wayne'
    fill_in 'Email', with: 'batman@gmail.com'
    fill_in 'Password', with: 'batman123'
    fill_in 'Password confirmation', with: 'batman123'
    click_button 'Sign up'
    expect(page).to have_content('Hello BruceBatman. You are now signed in!')
  end
end
