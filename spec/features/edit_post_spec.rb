require 'rails_helper'

RSpec.feature 'Users can edit a post that has been created', type: :feature do
  scenario 'User edits a post' do
    visit('/')
    click_on('Signup')
    fill_in('user[username]', with: 'user1')
    fill_in('user[email]', with: 'test@test.com')
    fill_in('user[password]', with: 'password')
    click_on('Join the Rebel Alliance')
    click_on 'New Post'
    fill_in 'post[post_content]', with: 'Hesyy thesareasdf'
    click_on 'Create Post'
    expect(page).to have_content('Hesyy thesareasdf')
    click_on 'Edit'
    fill_in 'post[post_content]', with: 'Hey there'
    click_on 'Update Post'
    expect(page).to have_content('Post was successfully updated')
    expect(page).to have_content('Hey there')
  end

  scenario 'User is not allowed to edit someone elses post' do
    visit '/'
    click_on 'Signup'
    fill_in('user[username]', with: 'user1')
    fill_in 'user[email]', with: 'test@test.com'
    fill_in 'user[password]', with: 'password'
    click_on 'Join the Rebel Alliance'
    click_on 'wookiebook'
    click_on 'New Post'
    fill_in 'post[post_content]', with: 'Hey there'
    click_on 'Create Post'
    click_on 'Logout'
    click_on 'Signup'
    fill_in('user[username]', with: 'user2')
    fill_in 'user[email]', with: 'test2@test.com'
    fill_in 'user[password]', with: 'password'
    click_on 'Join the Rebel Alliance'
    click_on 'wookiebook'
    click_on 'Edit'
    expect(page).to have_content('Not authorized to update this post')
  end
end
