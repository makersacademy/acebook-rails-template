require 'rails_helper'

RSpec.feature 'User', type: :feature do
  scenario 'Posts done on different user walls, all appear on main post feed' do
    register_user(email = 'test1@test.com')
    click_link 'New post'
    fill_in 'post_message', with: 'Hello, world!'
    click_button 'Submit'
    register_user(email = 'test2@test.com')
    click_link 'New post'
    fill_in 'post_message', with: 'Goodbye, world!'
    click_button 'Submit'
    visit '/posts'
    expect(page).to have_content('Hello, world!')
    expect(page).to have_content('Goodbye, world!')
  end
end