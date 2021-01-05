require 'rails_helper'
require 'helpers/user_helper'

RSpec.feature "User post ownership", type: :feature do
    scenario "User can edit their own post" do
      sign_up
      find('.field').set("Wendy shall dominate the world!")
      click_button "Post"
      click_link "Edit"
      fill_in "post_postBody", with: "Susan shall dominate the world!"
      click_button "Update"
      expect(page).to have_content("Post was successfully updated.")
    end
  end

  RSpec.feature "User post ownership", type: :feature do
    scenario "User can edit their own post" do
      sign_up
      find('.field').set("Wendy shall dominate the world!")
      click_button "Post"
      click_link "Sign Out"
      sign_up2
      expect(page).to have_no_button('Edit')
    end
  end

