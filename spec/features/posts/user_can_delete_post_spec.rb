require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "User deletes a post they created" do
    log_in_test_user
    submit_post("I'm prime for deletion")
    click_on 'Delete Post'
    expect(page).not_to have_content "I'm prime for deletion"
  end

  scenario "User cannot delete another users post" do
    log_in_test_user
    submit_post("Another user cannot touch me! Ha ha!")
    click_link "Logout"
    expect(page).to have_content "Signed out successfully"
    log_in_test_user_2
    expect(page).not_to have_button "Delete Post"    
  end

  scenario "User deletes a post and its comments" do
    log_in_test_user
    submit_post("I'm prime for deletion")
    add_comment
    click_on 'Delete Post'
    expect(page).not_to have_content "Test Comment"
  end

end
