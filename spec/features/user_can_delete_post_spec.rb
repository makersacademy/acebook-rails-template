require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "User deletes a created post" do
    log_in_test_user
    submit_post("I'm prime for deletion")
    click_on 'Delete Post'
    expect(page).not_to have_content "I'm prime for deletion"
  end

  scenario "User deletes a post and its comments" do
    log_in_test_user
    submit_post("I'm prime for deletion")
    fill_in 'comment_message', with: 'Test Comment'
    click_on 'Add comment'
    click_on 'Delete Post'
    expect(page).not_to have_content "Test Comment"
  end
end
