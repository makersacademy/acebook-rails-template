require 'rails_helper'

RSpec.feature "Deleting", type: :feature do
  scenario "Can delete posts" do
    sign_up
    add_post
    click_link "Delete"
    expect(page).not_to have_content("Hello, world!")
    expect(page).to have_current_path("/posts")
  end
end
