require 'rails_helper'

RSpec.feature "New Posts", type: :feature do
  scenario "user can post message" do
    visit "/posts/new"
    fill_in :post_content, with: "test"
    click_button "submit"
    expect(page).to have_content("test")
  end

end
