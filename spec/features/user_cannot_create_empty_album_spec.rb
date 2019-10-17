require 'rails_helper'

RSpec.feature "photo_album", type: :feature do
  scenario "Cannot create album that is empty" do
    register
    visit "/albums"
    click_link "New Album"
    fill_in "album[name]", with: "Toast"
    fill_in "album[title]", with: "cool"
    fill_in "album[body]", with: "nice pic"
    click_button "Create Album"
    expect(page).to have_content("Images are missing!")
  end
end
