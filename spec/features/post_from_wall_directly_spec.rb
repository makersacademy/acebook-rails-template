# frozen_string_literal: true

feature 'user can post from their wall' do
  scenario 'post on your wall does not display on the main one' do
    sign_up
    fill_in 'post[message]', with: 'Post 1'
    click_button 'Add post'
    visit('/posts')
    expect(page).not_to have_content('Post 1')
  end
end
