require 'rails_helper'

feature 'comments', type: :feature do

  before do
    sign_up
    create_post
    log_out
    sign_up_as_second_user
  end

  scenario 'user can delete their own comment' do
    visit '/posts'
    click_link 'Comment'
    fill_in 'Body', with: 'new comment'
    click_button 'Submit'
    within(:css, 'div.comment') do
      click_link 'Delete'
      expect(page).to_not have_content('new comment')
      expect(page).to have_content('Comment deleted')
    end
  end
end
