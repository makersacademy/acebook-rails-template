require 'rails_helper'

RSpec.feature "User Page", type: :feature do
  scenario "User can view other user pages" do
    visit "/users/2"
    expect(page).to have_content("2")
  end
end
