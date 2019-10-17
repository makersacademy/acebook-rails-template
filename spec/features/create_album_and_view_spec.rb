require 'rails_helper'

RSpec.feature "photo_album", type: :feature do
  scenario "create and view album" do
    register
    visit "/albums"
    click_link "New Album"
    fill_in "album[name]", with: "POTATE"
    fill_in "album[title]", with: "a few potates"
    fill_in "album[body]", with: "yep"
    attach_file("album[images][]", Rails.root + "spec/fixtures/potate.jpg")
    click_button "Create Album"
    expect(page).to have_content("a few potates")
  end
end


