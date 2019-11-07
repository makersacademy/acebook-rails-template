require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "User edits a created post" do
    log_in_test_user
    submit_post("I'm prime for editing - post 1")
    # submit_post("I'm prime for editing - post 2")
    click_link 'Edit post'
    expect(current_path).to include('/posts')
    fill_in 'post[message]', with: "post 2 edited"
    click_button "Update Post"
    expect(page).not_to have_content "I'm prime for editing - post 1"
    expect(page).to have_content "post 2 edited"
    # expect(page).to have_content "I'm prime for editing - post 1"
  end
end
