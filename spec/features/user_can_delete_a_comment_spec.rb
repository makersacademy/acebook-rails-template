require 'rails_helper'

RSpec.feature 'Deleting Comments', type: :feature do
  scenario 'Users can delete their own comments' do
    make_comment
    expect(page).to have_content('this is a comment')
    click_link 'Delete comment'
    expect(page).not_to have_content('this is a comment')
  end

  it 'cant delete comment when not signed in' do
    make_comment
    click_link 'Sign Out'
    click_link 'Timeline'
    expect(page).not_to have_button('Delete comment')
  end

  it 'cant delete someone elses comment' do
    make_comment
    click_link 'Sign Out'
    user_two
    expect(page).not_to have_button('Delete comment')
  end
end
