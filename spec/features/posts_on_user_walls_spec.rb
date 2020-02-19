require 'rails_helper'

RSpec.feature 'User', type: :feature do

  scenario 'Users wall contains posts they posted on their own wall' do
    visit '/'
    sign_up
    new_post_on_own_wall
    visit user_page_path(User.all.first.id)
    expect(page).to have_content('Post to Myself')
  end

  scenario 'Posts Index contains posts a user posted on their own wall' do
    visit '/'
    sign_up
    new_post_on_own_wall
    visit '/posts'
    expect(page).to have_content('Post to Myself')
  end

  scenario 'Users wall contains posts they posted on the Posts Index' do
    visit '/'
    sign_up
    new_post #on Post's Index
    visit user_page_path(User.all.first.id) #users wall
    expect(page).to have_content('Hello, world!')
  end

  scenario 'Users wall does not contain posts they posted on another users wall' do
    visit '/'
    sign_up
    click_link 'Logout'
    sign_up_two
    new_post_on_other_users_wall
    visit user_page_path(User.all.last.id) #user2's wall
    expect(page).not_to have_content('Post to My Friend')
  end

  scenario 'Users posts posted on another user\'s wall can only be seen on that wall' do
    visit '/'
    sign_up
    click_link 'Logout'
    sign_up_two
    new_post_on_other_users_wall
    visit user_page_path(User.all.first.id) #user1's wall
    expect(page).to have_content('Post to My Friend')
    visit '/posts'
    expect(page).not_to have_content('Post to My Friend')
  end
end
