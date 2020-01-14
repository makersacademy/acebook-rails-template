require 'rails_helper'

RSpec.feature "Delete", type: :feature do
  scenario "Can delete specific posts" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Test post 1"
    click_button "Submit"
    click_link "New post"
    fill_in "Message", with: "Test post 2"
    click_button "Submit"
    
    within('div#1') do
      click_button "Test post 1"
    end

    expect(page).not_to have_content("Test post 1")
    expect(page).to have_content("Test post 2")
  end
end