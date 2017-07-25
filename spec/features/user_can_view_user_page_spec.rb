require 'rails_helper'

RSpec.feature "User Page", type: :feature do
  scenario "User can view other user pages" do
    visit "/users/1"
    expect(page).to have_content("1")
  end
end
