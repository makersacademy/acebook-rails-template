require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  scenario "User can comment on a post" do
    visit "/posts"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    fill_in "Comment", with: "Nice one!"
    click_button "Submit comment"
    expect(page).to have_content("Nice one!")
  end
end