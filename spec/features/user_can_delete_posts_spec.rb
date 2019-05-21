require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
 scenario "Can submit posts and delete them" do
   visit "/posts"
   click_link "New post"
   fill_in "Message", with: "Hello, world!"
   click_button "Submit"
   click_link "Destroy"
   expect(page).not_to have_content("Hello, world!")
 end
end
