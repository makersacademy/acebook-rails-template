require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view posts, date, time and username' do
    sign_up
    new_post
    click_link 'Delete'
    expect(page).not_to have_content('Hello, world!')
  end

  scenario 'user cannot delete another users posts' do 
    sign_up
    new_post
    visit '/'
    click_link 'Logout'
    sign_up_two 
    visit '/posts'
    click_link 'Delete'
    expect(page).to have_content('Sorry you cannot delete another User\'s posts')
    expect(page).to have_content('Hello, world!')
  end
end
