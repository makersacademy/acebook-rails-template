require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    fill_in "field", with: "Wendy shall dominate the world!"
    click_button "Post"
    expect(page).to have_content("Wendy shall dominate the world!")
  end
end
