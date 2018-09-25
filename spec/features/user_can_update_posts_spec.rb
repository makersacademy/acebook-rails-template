require 'rails_helper'

RSpec.feature "Update Posts", type: :feature do
  scenario "user can update post" do
    visit "/posts/new"
    fill_in "content", with: "test"
    click_button "submit"
    visit("/")
    click_link "test"
    expect(page).to have_content("test")
    page.should have_selector(:link_or_button, 'Edit')
    click_link "Edit"
    fill_in "content", with: "test2"
    click_button "submit"
    expect(page).to have_content("test2")
  end
end
