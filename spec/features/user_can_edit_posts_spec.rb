require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
    scenario "Posts page" do
      visit "/posts"
      click_link "Add a post"
      fill_in "Message", with: "Hello, world!"
      click_button "Submit"
      click_on "Edit"
      fill_in "Message", with: "Goodbye, world!"
      expect(page).not_to have_content("Goodbye, world!")
    end
end