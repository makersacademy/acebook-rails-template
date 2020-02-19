require 'rails_helper'

RSpec.feature 'User', type: :feature do
  scenario 'Posts posted on a user\'s wall can only be seen on that wall' do
    visit '/'
    sign_up #user1
    click_link 'Logout'
    sign_up_two #user2
    visit user_page_path(User.all.first.id) #user1's page
    click_link 'New post'
    fill_in "area", with: 'Hello, user one!'
    click_button 'Submit'
    visit user_page_path(User.all.first.id) #user1's page
    expect(page).to have_content('Hello, user one!')
  end
end
