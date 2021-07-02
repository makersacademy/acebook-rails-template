require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  scenario "User can comment on post" do
    successfullogin
    expect(current_path).to eq('/posts')
    fill_in "post[message]", with: "Hello, world!"
    click_link "Post"
    # save_and_open_page
    expect(page).to have_content("Hello, world!")
    fill_in "comment[body]", with: "Test Comment"
    click_button "commit"
    expect(page).to have_content("Test Comment")
  end
end