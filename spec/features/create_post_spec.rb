require 'rails_helper'

RSpec.feature 'Users can create a post', type: :feature do
  scenario 'User creates a post' do
    visit('/')
    click_on('Signup')
    fill_in('user[email]', with: 'test@test.com')
    fill_in('user[password]', with: 'password')
    click_on('Signup')
    click_on 'New Post'
    fill_in 'post[post_content]', with: 'Hey there'
    click_on 'Create Post'
    post_time = Post.all[0].created_at
    expect(page).to have_content('Hey there')
    expect(page).to have_content(post_time)
    expect(page).to have_content('test@test.com')
  end
end
