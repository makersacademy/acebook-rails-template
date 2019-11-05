require 'rails_helper'

RSpec.feature "Delete post", type: :feature do
  scenario "Can delete posts" do
    visit "/posts"
    create_post
    click_button "Delete"
    expect(page).to have_no_content("Hello, world!")
  end
end
