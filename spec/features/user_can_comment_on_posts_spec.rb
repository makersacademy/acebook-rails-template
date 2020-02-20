require 'rails_helper'

RSpec.feature 'Comment', type: :feature do
  scenario 'user can submit comment on a post' do
    sign_up
    new_post
    click_link 'Add Comment'
    fill_in 'comment[body]', with: 'First Comment'
    click_on 'Save'
    expect(page).to have_content('First Comment')
  end

  scenario 'user can see comments after posting' do
    sign_up
    new_post
    click_link 'Add Comment'
    fill_in 'comment[body]', with: 'First Comment'
    click_on 'Save'
    visit '/posts'
    expect(page).to have_content('First Comment')
  end

  scenario 'user can see comments on page when adding a new comment' do
    sign_up
    new_post
    click_link 'Add Comment'
    fill_in 'comment[body]', with: 'First Comment'
    click_on 'Save'
    visit '/posts'
    click_link 'Add Comment'
    expect(page).to have_content('First Comment')
  end

  scenario 'User sees a message if comment was posted successfully' do
    sign_up
    new_post
    click_link 'Add Comment'
    fill_in 'comment[body]', with: 'First Comment'
    click_on 'Save'
    expect(page).to have_content('Comment posted successfully')
  end

  scenario 'user can comment on a post on a users wall' do
    sign_up
    new_post
    visit user_page_path(User.all.first.id)
    click_link 'Add Comment'
    fill_in 'comment[body]', with: 'First Comment'
    click_on 'Save'
    expect(page).to have_content('First Comment')
  end

end 