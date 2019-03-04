require 'rails_helper'

RSpec.feature "Edit a post", type: :feature do
  scenario "A user can edit a post" do
    login_george_manyposts
    within("table") do
      click_link("Edit")
    end
    fill_in "post_message", with: "Edited message"
    click_on "Submit"
    expect(page.html).to include("Edited message")
  end
end
