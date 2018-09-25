require 'rails_helper'

RSpec.feature "homepage", type: :feature do
  scenario "user visits homepage" do
    visit "/"
    expect(page).to have_content("acebook")
  end

  scenario "user can post message" do
    visit "/"
    fill_in "new_post", with: "test"
    click_button "Submit"
    expect(page).to have_content("test")
  end
end
