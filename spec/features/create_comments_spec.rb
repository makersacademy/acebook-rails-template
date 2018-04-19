require 'rails_helper'

RSpec.feature 'add comments' do
  scenario 'user can add a comment to a post' do
    sign_up
    new_post
    click_link 'comments'
    click_link 'New Comment'
    fill_in 'comment_post_id', with: 1
    fill_in 'comment_body', with: 'text'
    click_on 'Create Comment'
    expect(page).to have_content 'text'
  end
end
