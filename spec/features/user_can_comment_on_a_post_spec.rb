require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can comment on a post" do
    register
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
    fill_in "comment[body]", with: "This is a comment"
    click_button "Create Comment"
    expect(page).to have_content("This is a comment")
  end
end
