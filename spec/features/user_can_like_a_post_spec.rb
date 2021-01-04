require 'rails_helper'

RSpec.feature 'User can like a post', type: :feature do
  scenario 'A registered user can like a post' do
    register
    click_link 'Timeline'
    click_link 'New Post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_button('👍')
    expect(page).to have_button('👍 1')
  end

  scenario 'A registered user can unlike their like' do
    register
    click_link 'Timeline'
    click_link 'New Post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_button('👍')
    expect(page).to have_button('👍 1')
    click_button('👍')
    expect(page).to have_button('👍 0')
  end
end
