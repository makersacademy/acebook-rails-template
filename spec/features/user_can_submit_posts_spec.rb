require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/timeline"
    fill_in "post_content", with: "Hello, world!"
    click_button "New Post"
    expect(page).to have_content("Hello, world!")
  end
end

RSpec.feature "Profile Page", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/users/1"
    fill_in "post_content", with: "Hello, world!"
    click_button "New Post"
    expect(page).to have_content("Hello, world!")
  end
end
