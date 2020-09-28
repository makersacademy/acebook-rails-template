require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit comments and view them" do
    signup_and_login
    add_post('Post 1')
    fill_in "Comment", with: "Comment 1"
    click_button "Create Comment"
    expect(page).to have_content("Comment 1")
  end

  scenario "Editing comment" do
    signup_and_login
    add_post('Post 2')
    fill_in "Comment", with: "Comment 2"
    click_button "Create Comment"
    expect(page).to have_content("Comment 2")
    click_link "edit-comment"
    fill_in "comment[comment]", with: "Edited Comment 2"
    click_button "Update Comment"
    expect(page).to have_content("Edited Comment 2")
  end

  scenario "User can delete a comment" do
    signup_and_login
    add_post('Post 3')
    fill_in "Comment", with: "Comment 3"
    click_button "Create Comment"
    click_link "delete-comment"
    expect(page).not_to have_content("Comment 3")
  end

end
