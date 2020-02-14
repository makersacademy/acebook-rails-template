# frozen_string_literal: true

feature 'user can post from the wall' do
  scenario 'current user can post on the main wall directly' do
    sign_up
    fill_in 'post[message]', with: 'Post 1'
    click_button 'Add post'
    visit('/posts')
    expect(page).to have_content('Post 1')
  end
end
