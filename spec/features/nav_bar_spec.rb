require 'rails_helper'

RSpec.feature "Navigation Bar", type: :feature do
  scenario "navigation bar home button is present on edit bio page" do
    visit "/bios"
    click_link "New Bio"
    fill_in "Age", with: "20"
    fill_in "Bio", with: "likes to eat food"
    fill_in "Location", with: "sadly brentford"
    click_button "Create Bio"
    click_link "Edit"
    expect(page).to have_button("Home")

  end
  scenario "navigation bar my page button is present on edit bio page" do
    visit "/bios"
    click_link "New Bio"
    fill_in "Age", with: "20"
    fill_in "Bio", with: "likes to eat food"
    fill_in "Location", with: "sadly brentford"
    click_button "Create Bio"
    click_link "Edit"
    expect(page).to have_button("My Page")

  end
  scenario "navigation bar logout button is present on edit bio page" do
    visit "/bios"
    click_link "New Bio"
    fill_in "Age", with: "20"
    fill_in "Bio", with: "likes to eat food"
    fill_in "Location", with: "sadly brentford"
    click_button "Create Bio"
    click_link "Edit"
    expect(page).to have_button("Logout")

  end
end
