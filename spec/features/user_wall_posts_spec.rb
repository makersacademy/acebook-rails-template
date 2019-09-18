require 'rails_helper'

RSpec.feature 'UserWallPosts', type: :feature do
  scenario 'user sees wall posts on their wall' do
    user = sign_in
    create_wall_post('This is a wall post', user.id)

    visit("/users/#{user.id}")
    expect(page).to have_content('This is a wall post')
    visit('/posts')
    expect(page).not_to have_content('This is a wall post')
  end

  scenario 'user makes public post, it appears on their wall' do
    user = sign_in
    create_post('public post for public and wall viewing')
    visit('/posts')
    expect(page).to have_content('public post for public and wall viewing')
    visit("/users/#{user.id}")
    expect(page).to have_content('public post for public and wall viewing')
  end

  scenario 'user makes public and wall post' do
    user = sign_in
    visit '/posts'
    create_post('public post for public and wall viewing')
    create_wall_post('This is a wall post', user.id)

    visit("/users/#{user.id}")
    expect(page).to have_content('This is a wall post')
    expect(page).to have_content('public post for public and wall viewing')
    visit('/posts')
    expect(page).not_to have_content('This is a wall post')
    expect(page).to have_content('public post for public and wall viewing')
  end
end
