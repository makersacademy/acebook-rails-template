require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit comments on posts" do
    visit "/posts"
    click_link "Show"
    fill_in "Commenter", with: "Charlene"
    fill_in "Comment", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Charlene")
    expect(page).to have_content("Hello, world!")
  end
end
