require 'rails_helper'

RSpec.feature 'User', type: :feature do
  scenario 'Posts posted on a user\'s wall can only be seen on that wall' do
    visit '/'
    sign_up
    click_link 'Logout'
    sign_up_two
    visit user_page_path(User.all.first.id)
    click_link 'New post'
    fill_in "area", with: 'Hello, user one!'
    click_button 'Submit'
    visit user_page_path(User.all.first.id)
    expect(page).to have_content('Hello, user one!')
  end
end