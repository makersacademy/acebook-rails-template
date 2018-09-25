require 'rails_helper'

RSpec.feature "New Posts", type: :feature do
  scenario "user can post message" do
    visit "/posts/new"
    fill_in "content", with: "test_to_delete"
    click_button "submit"
    visit("/")
    click_link "test_to_delete"
    expect(page).to have_content("test_to_delete")
    page.should have_selector(:link_or_button, 'Delete')
    click_link "Delete"
    visit("/")
    expect(page).not_to have_content("test_to_delete")
  end

end
