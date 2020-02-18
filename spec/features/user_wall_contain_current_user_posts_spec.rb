require 'rails_helper'

RSpec.feature 'User', type: :feature do
  scenario 'User can see their own posts on their wall' do
    visit '/'
    sign_up
    new_post
    click_link 'Logout'
    sign_up_two
    new_post_two
    visit user_page_path(User.all.last.id)
    expect(page).to have_content('Howdy, world!')
    expect(page).not_to have_content('Hello, world!')
  end

  scenario 'User can see other users\' posts on their wall' do
    visit '/'
    sign_up_two
    new_post_two
    click_link 'Logout'
    sign_up
    new_post
    visit user_page_path(User.all.last.id)
    expect(page).to have_content('Hello, world!')
    expect(page).not_to have_content('Howdy, world!')
  end
end

