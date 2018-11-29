require 'rails_helper'

feature 'Wall posts comment' do

  before do
    sign_up
    create_wall_post
    click_link 'Comment'
    fill_in 'Body', with: 'New comment'
    click_button 'Submit'
  end

  scenario 'user can comment on wall posts' do
    expect(page).to have_content('New comment')
  end

  scenario 'user can delete comments on wall posts' do
    within(".comment") do
      click_link 'Delete'
    end
    expect(page).not_to have_content 'New comment'
    expect(page).to have_content 'Your newsfeed'
  end

  scenario 'user only delete their comments on wall posts' do
    log_out
    sign_up_as_second_user
    click_link 'Users'
    click_link 'Amy Smith'
    within(".comment") do
      click_link 'Delete'
    end
    expect(page).to have_content "You cannot delete someone else's comment"
  end

end
