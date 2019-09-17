require 'rails_helper'

RSpec.feature 'UserWallPosts', type: :feature do
  scenario 'user sees wall posts on their wall' do
    user = sign_in
    visit("/users/#{user.id}")
    fill_in('.new-post-form', with: 'This is a wall post')
    click_button 'post-submit'
    visit("/users/#{user.id}")
    expect(page).to have_content('This is a wall post')
    visit('/posts')
    expect(page).not_to have_content('This is a wall post')
  end

  pending 'user makes wall post on other users wall, sees it on the other users wall'

  scenario 'user makes public post, it appears on their wall' do
    user = sign_in
    Post.create(user_id: user.id, message: 'public post for public and wall viewing')
    visit('/posts')
    expect(page).to have_content('public post for public and wall viewing')
    visit("/users/#{user.id}")
    expect(page).to have_content('public post for public and wall viewing')
  end
end
