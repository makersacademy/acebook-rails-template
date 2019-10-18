require 'rails_helper'

RSpec.feature "Album", type: :feature do
  scenario "Can 'like' and 'unlike' an album" do
    register
    create_album
    expect(page).to have_content("a few potates")
    expect(page).to have_content("0")
    click_link "Like"
    expect(page).to have_content("1")
    expect(page).not_to have_content("0")
  end
end