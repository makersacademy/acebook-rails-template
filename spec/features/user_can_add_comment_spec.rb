require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can edit posts and view them' do
    # TODO: add login helper method
    sign_in
    visit '/posts'
    click_button :"new-post-button" # "New Post"
    fill_in :post_message, with: 'Hello, world!'
    click_button 'Submit'
    fill_in 'comment[body]', with: 'This is a comment'
    click_button 'Create Comment'
    expect(page).to have_content('This is a comment')
  end

  scenario 'A user can see a comments owner' do
    visit '/sign_up'
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: 'password'
    click_button 'Sign up'
    visit '/posts'
    # click_button 'New Post'
    click_button :"new-post-button" # "New Post"
    fill_in :post_message, with: 'Hello, world!'
    # fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    fill_in 'comment[body]', with: 'This is a comment'
    click_button 'Create Comment'
    expect(page).to have_content('Commenter: test@test.com')
  end
end
