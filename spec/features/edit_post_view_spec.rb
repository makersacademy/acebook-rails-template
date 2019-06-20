require 'rails_helper'

RSpec.feature 'Edit Post', type: :feature do
  scenario 'Can edit a single post' do
    visit('/posts')
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    
    click_link 'Edit'
    fill_in 'Message', with: 'Hello, space universe!'
    click_button 'Submit'

    expect(page).to have_content('Hello, space universe!')
  end
end
