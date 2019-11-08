require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "User edits a created post" do
    log_in_test_user
    submit_post("I'm prime for editing - post 1")
    click_link "Logout"
    expect(page).to have_content "Signed out successfully"
    log_in_test_user_2
    expect(page).not_to have_button "Edit post"
  end
end
