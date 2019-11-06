require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "User edits a created post" do
    log_in_test_user
    submit_post("I'm prime for editing")
    click_on 'Edit Post'
    fill_in "Message", with: "I've been edited"
    click_button "Edit Post"
    expect(page).not_to have_content "I'm prime for editing"
    expect(page).to have_content "I've been edited"
  end
end
