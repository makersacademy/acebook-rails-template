require 'rails_helper'

RSpec.feature 'Comments', type: :feature do
  scenario "User can delete comment" do
    log_in_test_user
    submit_post("Hello")
    add_comment
    click_on "Delete Comment"
    expect(page).not_to have_content "Test Comment"
  end

  scenario "User cannot delete another users comment" do
    log_in_test_user
    submit_post("Can't delete me")
    click_link "Logout"
    expect(page).to have_content "Signed out successfully"
    log_in_test_user_2
    expect(page).not_to have_button "Delete Comment"
  end
end