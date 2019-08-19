# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view them' do
    visit '/'
    fill_in 'Username', with: 'Example'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'testing123'
    fill_in 'Confirmation', with: 'testing123'
    click_button 'Create my account'

    visit '/'
    fill_in 'Username', with: 'Example2'
    fill_in 'Email', with: 'test2@example.com'
    fill_in 'Password', with: 'testing123'
    fill_in 'Confirmation', with: 'testing123'
    click_button 'Create my account'
    click_button 'Users'
    click_link 'View Wall'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content('Hello, world!')

    visit '/'
    expect(page).not_to have_content('Hello, world!')
  end
end