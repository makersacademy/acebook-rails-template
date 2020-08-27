require 'rails_helper'

RSpec.feature "creating posts", type: :feature do
  scenario 'user can create posts' do
    visit "/posts/new"
    fill_in "Message", with: "Test content"
    click_button "Submit"
    expect(page).to have_content("Test content")
  end
end
RSpec.feature "deleting posts", type: :feature do
  scenario 'user can delete posts' do
    visit "/posts/new"
    fill_in "Message", with: "Test content"
    click_button "Submit"
    expect(page).to have_content("Test content")
    click_link "Delete"
    expect(page).not_to have_content("Test content")

  end
end
