require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit_page_and_post
    expect(page).to have_content("Hello, world!")
    click_link "Delete"
    expect(page).not_to have_content("Goodbye, world!")
  end
end
