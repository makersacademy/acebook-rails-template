require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit comments and view them" do
    visit "/"
    click_link "New post"
    fill_in "post[message]", with: "Hello, world!"
    click_button "Throw"
    fill_in "comment[body]", with: "Hello, Mars!"
    click_button "Comment"
    expect(page).to have_content("Hello, Mars!")
    expect(page).to have_content("mins ago")
  end
end
