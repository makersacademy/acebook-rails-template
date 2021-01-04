require 'rails_helper'

RSpec.feature 'User post list', type: :feature do
  scenario 'When signed out clicking profile should take you to main post page' do
    visit '/'
    click_link 'Profile'
    expect(page).to have_current_path(posts_path)
  end

  scenario 'When signed in you can click profile to see your own posts' do
    register
    click_link 'Profile'
    expect(page).to have_content "Test123's profile page"
  end

  scenario 'After making a post the name in the post page links to that profile' do
    register
    click_link 'Timeline'
    click_link 'New Post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_link 'Test123'
    click_link 'Test123'
    expect(page).to have_content "Test123's profile page"
  end
end
