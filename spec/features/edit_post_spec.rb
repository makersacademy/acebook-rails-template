# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Edit', type: :feature do
  scenario 'Can eidt own posts' do
    visit '/'
    fill_in 'Username', with: 'Example'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'testing123'
    fill_in 'Confirmation', with: 'testing123'
    click_button 'Create my account'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_link 'Edit'
    click_button 'Submit'
    expect(page).to have_content('Hello, world!')
  end

  scenario 'Can not edit another users post' do
    visit '/'
    fill_in 'Username', with: 'Example'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'testing123'
    fill_in 'Confirmation', with: 'testing123'
    click_button 'Create my account'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'

    visit '/'
    fill_in 'Username', with: 'Example2'
    fill_in 'Email', with: 'test@example2.com'
    fill_in 'Password', with: 'testing123'
    fill_in 'Confirmation', with: 'testing123'
    click_button 'Create my account'
    click_link 'Edit'
    expect(page).to have_content("This isn't your post!")
    expect(page).to have_content('Hello, world!')
  end
end
