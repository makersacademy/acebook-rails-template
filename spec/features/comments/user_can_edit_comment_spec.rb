require 'rails_helper'

RSpec.feature 'Comments', type: :feature do
  scenario "User can edit a comment they created" do
    log_in_test_user
    submit_post("Hello")
    add_comment
    click_link "Edit comment"
    expect(current_path).to eq '/posts'
    fill_in "[post, comment]", with: "comment edited"
    click_button "Update Comment"
    expect(page).not_to have_content "Test Comment"
    expect(page).to have_content "comment edited"
  end
end