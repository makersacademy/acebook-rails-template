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
    create_message
    sign_up_user_2
    sign_in_user_2
    click_link 'Edit'
    expect(page).to have_content('You can only edit or delete your own posts')
  end
end
