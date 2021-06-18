require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  scenario "User can comment on post" do
    visit "/posts"
    fill_in "comment[body]", with: "Test Comment"
    click_button "submit"
    expect(page).to have_content("Test Comment")
  end
end