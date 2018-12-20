require 'rails_helper'

RSpec.feature "testing for the correct urls", type: :feature do
  scenario "bios list url " do
    visit "/bios"
    expect(page.current_url).to eq("http://www.example.com/bios")

  end
  scenario "new bio url " do
    visit "/bios"
    click_link "New Bio"
    expect(page.current_url).to eq("http://www.example.com/bios/new")

  end
  scenario "new bio url " do
    visit "/bios"
    click_link "New Bio"
    fill_in "Age", with: "20"
    fill_in "Bio", with: "likes to eat food"
    fill_in "Location", with: "sadly brentford"
    click_button "Create Bio"
    expect(page.current_url).to eq("http://www.example.com/bios/4")

  end
  scenario "returns to bio page when back is pressed after creating bio" do
    visit "/bios"
    click_link "New Bio"
    fill_in "Age", with: "20"
    fill_in "Bio", with: "likes to eat food"
    fill_in "Location", with: "sadly brentford"
    click_button "Create Bio"
    click_link "Back"
    expect(page.current_url).to eq("http://www.example.com/bios")



  end
end
