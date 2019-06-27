require 'rails_helper'

RSpec.feature 'Edit Post', type: :feature do
  scenario 'Can edit a single post' do
    create_message
    click_link 'Edit'
    fill_in "Message", with: 'Hello, space universe!'
    click_button 'Submit'
    expect(page).to have_content('Hello, space universe!')
  end

  scenario 'User can only edit their own posts' do
    sign_up_another_user
    sign_in_another_user
    fill_in "post_message", with: 'Hello, space universe!'
    click_button 'Submit'
    visit('/users/new')
    sign_up_user
    sign_in_user
    click_button 'Feed'
    click_link 'Edit'
    expect(page).to have_content('You can only edit your own posts')
  end
end
