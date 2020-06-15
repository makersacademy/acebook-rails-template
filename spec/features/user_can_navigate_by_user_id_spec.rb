require 'rails_helper'

RSpec.feature "URL Navigation", type: :feature do
  scenario "A user can navigate to another users wall with their user id" do
    signup
    click_link "New post"
    fill_in "Content", with: "Say hello to my little calves!"
    click_button "Create Post"
    click_link "Back"
    click_link "Sign out"
    signup2
    visit "/users/1"
    expect(page).to have_content("Say hello to my little calves!")
  end
end
