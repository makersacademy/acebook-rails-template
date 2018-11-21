require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and edit them' do
    user = create(:user)
    login_as(user, scope: :user)
    visit '/posts'
    click_link 'New post'
    fill_in 'post[message]', with: 'This is a test post!'
    click_button 'Create Post'
    visit '/posts'
    click_link 'Edit'
    fill_in 'post[message]', with: 'This is an edited post!'
    click_button 'Update Post'
    expect(page).to have_content('This is an edited post!')
  end
  scenario 'Cannot edit others posts' do
    user = create(:user)
    login_as(user, scope: :user)
    visit '/posts'
    click_link 'New post'
    fill_in 'post[message]', with: 'This is a test post!'
    click_button 'Create Post'
    second_user = create(:user, email: 'joel@test.com', name: 'Joel', password: 'password123')
    login_as(second_user, scope: :user)
    visit '/posts'
    click_link 'Show'
    expect(page).not_to have_content('Edit')
  end
end
