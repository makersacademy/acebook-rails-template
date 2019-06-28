require 'rails_helper'
include ActiveSupport::Testing::TimeHelpers

RSpec.feature "update function", type: :feature do

 scenario "A user can edit a post within 10 minutes" do
   signup
   click_link "New post"
   fill_in "Content", with: "Say hello to my little calves!"
   click_button "Create Post"
   travel(597)
   click_link "Back"
   expect(page).to have_content("Edit")
 end

 scenario "A user cannot edit a post after 10 minutes" do
   signup
   click_link "New post"
   fill_in "Content", with: "Say hello to my little calves!"
   click_button "Create Post"
   travel(700)
   click_link "Back"
   expect(page).to_not have_content("Edit")
 end
end
