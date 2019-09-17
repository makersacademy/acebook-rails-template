require 'rails_helper'

RSpec.feature 'The number of characters in a post is limited', type: :feature do
  scenario 'A user cannot input a really long post' do
    sign_in

    visit('/posts')
    click_on '+'
    fill_in 'post_message', with: ('My' * 2001)
    click_button 'Submit'
  

     expect(page).to have_content('Your post is too long.')
  end

  scenario 'A user cannot update a post to length of > 4000 characters' do
    sign_in
    visit '/posts'
    click_button '+'
    fill_in 'post[message]', with: 'Hello, world!'
    click_button 'Submit'
    click_button 'Edit Post'
    fill_in 'post[message]', with: 'He' * 2001
    click_button 'Submit'
    expect(page).to have_content('Your post is too long.')



     expect(page).to have_content('Your post is too long.')
  end
end
