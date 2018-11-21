require 'rails_helper'

RSpec.feature 'Liking', type: :feature do
  scenario 'liking a post from post page' do
    sign_in_and_create_post
    click_link 'Show'
    expect(page).to have_content 'Likes: 0'
    click_button 'Like'
    expect(page).to have_content 'Likes: 1'
  end
  scenario 'liking a post from home page' do
    sign_in_and_create_post
    expect(page).to have_content 'Like (0)'
    click_button 'Like'
    expect(page).to have_content 'Like (1)'
  end
end
