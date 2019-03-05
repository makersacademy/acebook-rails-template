require 'rails_helper'
require 'web_helper'

RSpec.feature "New post button", type: :feature do
  scenario "User can post on other users wall" do
    sign_up
    visit "#{User.first.id}"
    expect(page).to have_content("Bob's wall")
    expect(page).to have_link("new post")
    click_link "new post"
    fill_in "Message", with: "This is my post"
    click_button "Submit"
    expect(page).to have_content("Bob's wall")
    expect(page).to have_content("This is my post")
  end
end
