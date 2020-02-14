require 'rails_helper'

RSpec.feature 'Users can only view their own posts', type: :feature do
  scenario 'User creates a post and can only see their post' do
    
    user = User.create!(email: 'test@abc.com', password: 'password')
    Post.create!(user_id: user.id, post_content: 'test message')

    visit('/')
    click_on('Signup')
    fill_in('user[email]', with: 'test@test.com')
    fill_in('user[password]', with: 'password')
    click_on('Signup')
    click_on 'New Post'
    fill_in 'post[post_content]', with: 'Hey there'
    click_on 'Create Post'
    expect(page).to have_content('Hey there')
    expect(page).to have_content('test@test.com')
    expect(page).not_to have_content('test message')
    expect(page).not_to have_content('test@abc.com')
  end
end
