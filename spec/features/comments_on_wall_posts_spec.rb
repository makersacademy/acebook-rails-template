require 'rails_helper'

feature 'Wall posts comment' do
  scenario 'user can comment on wall posts' do
    sign_up
    create_wall_post
    click_link 'Comment'
    fill_in 'Body', with: 'New comment'
    click_button 'Submit'

    expect(page).to have_content('New comment')
  end
end
