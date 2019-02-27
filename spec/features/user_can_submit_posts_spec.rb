require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Cannot submit posts and view them if not logged in" do
    visit "/posts"
    # click_link "New post"
    # fill_in "Message", with: "Hello, world!"
    # click_button "Submit"
    expect(page).to have_content("You need to sign in or sign up")
  end
end
