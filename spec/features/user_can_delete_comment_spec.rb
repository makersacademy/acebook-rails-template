require 'rails_helper'

RSpec.feature "Comment", type: :feature do
  scenario "Users can delete their own comments" do
    pending
    visit('/')
    create_user
    login_user
    create_post
    expect(page).to have_link('Show Comments (0)')
    click_link 'New Comment'
    # create_comment
    # delete_comment
    # expect(page).not_to have_content('A comment')
    # expect(page).to have_content('Comment deleted by HomerSimpson')
  end
end
