require 'rails_helper'

RSpec.feature 'Comments', type: :feature do
  before do
    sign_up_correct_helper
    create_post('Post 1')
  end
  scenario 'Post has "Add Comment" button' do
    expect(page).to have_selector('.comment-button')
  end
  scenario 'Comment button loads new comment page' do
    click_on('Comment')
    expect(page).to have_content('Type your comment below:')
  end
  scenario 'User can create comment' do
    click_on('Comment')
    fill_in('comment[message]', with: 'This is a comment')
    click_button("Submit")
    expect(page).to have_current_path('/posts')
    expect(page).to have_content('This is a comment')
  end

end
