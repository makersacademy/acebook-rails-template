require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can like a post' do
    sign_up
    new_post
    click_button 'Like'
    expect(page).to have_content('1 Like')
  end

  scenario 'Post can have multiple likes' do
    sign_up
    new_post
    click_button 'Like'
    visit '/'
    click_link 'Logout'
    sign_up_two
    visit '/posts'
    click_button 'Like'
    expect(page).to have_content('2 Likes')
  end

  scenario 'User cannot like post twice' do
    sign_up
    new_post
    click_button 'Like'
    expect(page).to have_content('1 Like')
    expect(page).to have_button('Unlike')
    click_button 'Unlike'
    expect(page).to have_content('0 Likes')
    expect(page).to have_button('Like')
  end
end
