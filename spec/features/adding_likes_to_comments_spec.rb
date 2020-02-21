# frozen_string_literal: true

feature 'user can like a post' do
  scenario 'from the timeline' do
    sign_up
    click_link 'Home'
    create_post
    click_button 'Like'
    expect(page).to have_content('1 Like')
    expect(page).to have_selector(:link_or_button, 'Unlike')
  end

  scenario 'from the user homepage' do
    sign_up
    create_post
    click_button 'Like'
    expect(page).to have_content('1 Like')
    expect(page).to have_selector(:link_or_button, 'Unlike')
  end
end
