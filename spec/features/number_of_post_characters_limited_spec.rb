require 'rails_helper'

RSpec.feature 'The number of characters in a post is limited', type: :feature do
  scenario 'A user cannot input a really long post' do
    sign_in

    visit('/posts')
    click_on 'New Post'
    fill_in 'post_message', with: ('My' * 2001)
    click_button 'Submit'
    puts (Post.first.message.length)

     expect(page).to have_content('Your post is too long.')
  end
end
