require 'rails_helper'

RSpec.feature "update function", type: :feature do

 scenario "A user can edit a post within 10 minutes" do
   signup
   click_link "New post"
   fill_in "Content", with: "Say hello to my little calves!"
   click_button "Create Post"
   Timecop.freeze(Time.now.utc + 9.minutes)
   click_link "Back"
   expect(page).to have_content("Edit")
   Timecop.return
 end

 scenario "A user cannot edit a post after 10 minutes" do
   signup
   click_link "New post"
   fill_in "Content", with: "Say hello to my little calves!"
   click_button "Create Post"
   Timecop.freeze(Time.now.utc + 11.minutes)
   click_link "Back"
   expect(page).to_not have_content("Edit")
   Timecop.return
 end
end
