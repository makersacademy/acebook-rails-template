require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can edit posts and view them' do
    # TODO: add login helper method
    sign_in
    post = create_post('This is a post')
    create_comment('This is a comment', post.id)
    visit('/posts')
    expect(page).to have_content('This is a comment')
  end

  scenario 'A user can see a comments owner' do
    visit '/sign_up'
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: 'password'
    click_button 'Sign up'
    post = create_post('a post')
    create_comment('This is a comment', post.id)
    visit('/posts')
    expect(page).to have_content('test@test.com')
  end

  scenario 'A user sees a message to let them know the comment was posted successfully' do
    visit '/sign_up'
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: 'password'
    click_button 'Sign up'
    post = create_post('a post')
    create_comment('This is a comment', post.id)

    expect(page).to have_content('Your comment was posted successfully')
  end
end
