# require 'rails_helper'
#
# RSpec.feature "photo_album", type: :feature do
#   scenario "Can submit photo and view them in album" do
#     register
#     visit "/albums"
#     click_link "New Album"
#     save_and_open_page
#     fill_in "Name", with: "Toast"
#     upload_photo
#     fill_in "Title", with: "cool"
#     fill_in "Body", with: "nice pic"
#     click_button "Create Album"
#     expect(page).to have_content("Hello, world!")
#   end
# end
