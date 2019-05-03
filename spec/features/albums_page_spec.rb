require 'rails_helper'

RSpec.feature "Albums page", type: :feature do

  scenario "user can visits the albums page" do
    sign_up_helper('photo@check.com','123456')
    visit '/albums'
    expect(page).to have_content("Albums")
  end

  scenario "user clicks on link to create an album and sees a page with a form to create a new album" do
    sign_up_helper('photo@check.com','123456')
    visit '/albums'
    click_button 'Create Album'
    expect(page).to have_css("form")
  end

  scenario "user fills in create album form and is redirect to a show page for that album" do
    sign_up_helper('photo@check.com','123456')
    visit '/albums/new'
    fill_in 'album_name', with: 'Shearing Harry'
    click_button 'Create'
    expect(page).to have_content 'Shearing Harry'
  end

  scenario "user clicks on link to upload photo on albums index and see's a form for uploading a photo" do
    sign_up_helper('photo@check.com','123456')
    visit '/albums/new'
    fill_in 'album_name', with: 'Shearing Harry'
    click_button 'Create'
    click_button 'Upload Photos'
    expect(page).to have_css("form")
  end

  scenario "User uploads a photo and sees it displayed on the album's page" do
    sign_up_helper('photo@check.com','123456')
    visit '/albums/new'
    fill_in 'album_name', with: 'Shearing Harry'
    click_button 'Create'
    click_button 'Upload Photos'
    attach_file 'album_photos', "images/avatar2.png"
    click_button 'Upload'
    expect(page).to have_content 'Shearing Harry'
    # expect(page).to have_css("img[src*='avatar2.png']")
  end
end
