require 'rails_helper'

RSpec.feature "Edit a post", type: :feature do
  scenario "A user can edit a post" do
    visit '/'
    fill_in "user_email", with: "george.manyposts@gmail.com"
    fill_in "user_password", with: 'gm1234'
    click_on "Log in"
    within("table") do
      click_link("Edit")
    end
    fill_in "post_message", with: "Edited message"
    click_on "Submit"
    expect(page.html).to include("Edited message")
  end
end