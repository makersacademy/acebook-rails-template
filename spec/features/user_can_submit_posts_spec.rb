require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do

  scenario 'Can submit posts and view them' do
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'New Post'
    expect(page).to have_content('Hello, world!')
  end

  scenario 'Can submit a post and present a date and time' do
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Whats the time?'
    click_button 'New Post'
    expect(page).to have_content("#{Time.now.strftime('%B %d %Y')}")
  end
end
