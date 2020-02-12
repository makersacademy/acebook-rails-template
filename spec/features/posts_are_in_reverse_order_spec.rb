# frozen_string_literal: true

feature 'posts are in reverse chronological order' do
  scenario 'user see the post in a reverse chronological order on posts homepage' do
    sign_up
    fill_in 'post[message]', with: 'Post 1'
    click_button 'Create Post'
    fill_in 'post[message]', with: 'Post 2'
    click_button 'Create Post'
    click_link 'home'
    expect(page).to have_content(/Post 2.*Post 1/)
  end

  scenario 'user see the post in a reverse chronological order on user homepage' do
    sign_up
    fill_in 'post[message]', with: 'Post 1'
    click_button 'Create Post'
    fill_in 'post[message]', with: 'Post 2'
    click_button 'Create Post'
    expect(page).to have_content(/Post 2.*Post 1/)
  end
end
