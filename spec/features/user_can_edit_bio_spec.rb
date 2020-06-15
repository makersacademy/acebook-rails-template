# require 'rails_helper'
#
# RSpec.feature "edit bio", type: :feature do
#   scenario "can edit the users bio " do
#     visit "/bios"
#     click_link "New Bio"
#     fill_in "Age", with: "20"
#     fill_in "Bio", with: "likes to eat food"
#     fill_in "Location", with: "sadly brentford"
#     click_button "Create Bio"
#     click_link "Edit"
#     fill_in "Age", with: "22"
#     fill_in "Bio", with: "likes to eat takeway food"
#     fill_in "Location", with: "sadly still brentford"
#     click_button "Update Bio"
#     expect(page).to have_content("22")
#     expect(page).to have_content("sadly still brentford")
#     expect(page).to have_content("likes to eat takeway food")
#     expect(page).to have_content("Bio was successfully updated.")
#
#   end
#   scenario "can edit the users bio and the list of bios page will be update " do
#     visit "/bios"
#     click_link "New Bio"
#     fill_in "Age", with: "20"
#     fill_in "Bio", with: "likes to eat food"
#     fill_in "Location", with: "sadly brentford"
#     click_button "Create Bio"
#     click_link "Edit"
#     fill_in "Age", with: "22"
#     fill_in "Bio", with: "likes to eat takeway food"
#     fill_in "Location", with: "sadly still brentford"
#     click_button "Update Bio"
#     expect(page).to have_content("22")
#     expect(page).to have_content("sadly still brentford")
#     expect(page).to have_content("likes to eat takeway food")
#     expect(page).to have_content("Bio was successfully updated.")
#     click_link "Back"
#     expect(page).to have_content("22")
#     expect(page).to have_content("sadly still brentford")
#     expect(page).to have_content("likes to eat takeway food")
#
#   end
# end
# RSpec.feature "delete bio", type: :feature do
#   scenario "can delete the bios" do
#     visit "/bios"
#     click_link "New Bio"
#     fill_in "Age", with: "20"
#     fill_in "Bio", with: "likes to eat food"
#     fill_in "Location", with: "sadly brentford"
#     click_button "Create Bio"
#     expect(page).to have_content("Bio was successfully created.")
#     expect(page).to have_content("20")
#     expect(page).to have_content("likes to eat food")
#     expect(page).to have_content("sadly brentford")
#     click_link "Back"
#     click_link "Destroy"
#     expect(page).not_to have_content("20")
#     expect(page).not_to have_content("likes to eat food")
#     expect(page).not_to have_content("sadly brentford")
#   end
# end
