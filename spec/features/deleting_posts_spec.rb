require 'rails_helper'

RSpec.feature 'Deleting Posts', type: :feature do
  scenario 'Users can delete their own posts' do
    register
    click_link 'Timeline'
    click_link 'New Post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content('Hello, world!')
    click_link 'delete'
    expect(page).not_to have_content('Hello, world!')
  end

  scenario 'Users cannot edit other users posts' do
    register
    click_link 'Timeline'
    click_link 'New Post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_link 'Sign Out'
    user_two
    click_link 'Timeline'
    expect(page).not_to have_link('delete')
  end
end
