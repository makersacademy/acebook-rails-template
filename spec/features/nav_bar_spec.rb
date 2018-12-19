require 'rails_helper'

RSpec.feature "Nav bar", type: :feature do
  scenario "appears on bios edit page" do
    visit "/bios"
    click_link "New Bio"
    fill_in "Age", with: "20"
    fill_in "Bio", with: "likes to eat food"
    fill_in "Location", with: "sadly brentford"
    click_button "Create Bio"
    click_link "Edit"
    expect(page).to have_button("My Page")
  end
end
