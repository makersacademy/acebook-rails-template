require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    sign_in
    visit "/posts"
    find('.field').set("Wendy shall dominate the world!")
    click_button "Post"
    expect(page).to have_content("Post was successfully created.")
  end
end
