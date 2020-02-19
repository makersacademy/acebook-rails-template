# frozen_string_literal: true

feature 'user can like a post' do
  scenario 'from another users homepage' do
    sign_up
    click_link 'Home'
    create_post
    click_button 'Like'
    click_link 'Sign Out'
    sign_up_two
    click_link 'Home'
    click_button 'Like'
    expect(page).to have_content('2 Likes')
    expect(page).to have_selector(:link_or_button, 'Unlike')
  end
end
