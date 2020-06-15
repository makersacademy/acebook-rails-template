require 'rails_helper'

RSpec.feature "Album", type: :feature do
  scenario "user can click create album" do
    sign_up_helper('email@duplicate.com','123456')
    visit ('/albums')
    click_button "Create Album"
    expect(page).to have_css("form")
  end

  scenario "user can create a new album" do
    sign_up_helper('email@duplicate.com','123456')
    visit ('/albums')
    click_button "Create Album"
    fill_in "album_name", with: "First Album"
    click_button "Create"
    expect(page).to have_content("First Album")
  end
end
