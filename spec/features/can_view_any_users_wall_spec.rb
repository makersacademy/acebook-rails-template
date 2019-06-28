require 'rails_helper'

RSpec.feature "Timeline", type: :feature do

#  scenario "A user can view any users wall" do
#    signup3
#    click_link "New post"
#    fill_in "Content", with: "Hello, world!"
#    click_button "Create Post"
#    click_link "Back"
#    click_link "Sign out"
#    signup2
#    click_link "All posts"
#    # click_link "Chris"
#    expect(page).to have_link("Chris")
#  end

 scenario "A user can view any users wall" do
   signup3
   click_link "New post"
   fill_in "Content", with: "Say hello to my little calves!"
   click_button "Create Post"
   click_link "Back"
   click_link "Sign out"
   signup2
   click_link "Chris"
   expect(page).to have_content("Say hello to my little calves!")
 end
end
