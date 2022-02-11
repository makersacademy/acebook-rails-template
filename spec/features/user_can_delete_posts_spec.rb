require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
    scenario "Posts page" do
      visit "/posts"
      click_link "Add a post"
      fill_in "Message", with: "Hello, world!"
      click_button "Submit"
      click_on "Delete"
      expect(page).not_to have_content("Hello, world!")
    end
end
