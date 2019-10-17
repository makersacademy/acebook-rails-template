require 'rails_helper'

RSpec.feature "photo_album", type: :feature do
  scenario "Cannot create album that is empty" do
    register
    visit "/albums"
    click_link "New Album"
    click_button "Create Album"
    expect(page).to have_content("Images are missing!")
  end
end
