# frozen_string_literal: true

feature 'posts are in reverse chronological order' do
  scenario 'user see the post in a reverse chronological order on posts Homepage' do
    sign_up
    click_link 'Home'
    fill_in 'post[message]', with: 'Post 1'
    click_button 'Add post'
    fill_in 'post[message]', with: 'Post 2'
    click_button 'Add post'
    visit('/posts')
    expect(page).to have_content(/Post 2.*Post 1/)
  end

  scenario 'user see the post in a reverse chronological order on user Homepage' do
    sign_up
    fill_in 'post[message]', with: 'Post 1'
    click_button 'Add post'
    fill_in 'post[message]', with: 'Post 2'
    click_button 'Add post'
    expect(page).to have_content(/Post 2.*Post 1/)
  end
end
