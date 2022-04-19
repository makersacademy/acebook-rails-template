require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    click_link "Add a post"
    fill_in "Message", with: "Add a post"
    click_button "Submit"
    expect(page).to have_content("Add a post")
  end
end
