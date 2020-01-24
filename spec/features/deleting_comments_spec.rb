require 'rails_helper'

RSpec.feature "Timeline", js: true, type: :feature do
  scenario "Can delete comments" do
    signup
    click_on "New Post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"

    click_button "Comments"
    fill_in "comment_text", with: "Some comment"
    click_button "Add"
    expect(page).to have_content("Some comment")

    click_on "delete_comment"
    expect(page.html).to_not have_content("Some comment")
  end
end
