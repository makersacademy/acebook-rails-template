require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit post to own wall and view it' do
    register_user
    visit '/1'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content('Hello, world!')
  end

  scenario 'Can submit post to another users wall and view it on other users wall' do
    register_user(email = 'test1@test.com')
    register_user(email = 'test2@test.com')
    visit '/1'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content('Hello, world!')
  end

  scenario 'Can submit post to another users wall and not be able to view post on own wall' do
    register_user(email = 'test1@test.com')
    register_user(email = 'test2@test.com')
    visit '/1'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    visit '/2'
    expect(page).to_not have_content('Hello, world!')
  end
end
