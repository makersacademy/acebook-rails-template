# frozen_string_literal: true

require 'rails_helper'
require 'clearance_helpers'

RSpec.feature 'User', type: :feature do
  before do
    sign_up_with('username', 'test@mail.com', 'testing')
  end

  scenario 'User has an album' do
    visit '/albums/new'
    fill_in "album_title", with: "Album title"
    click_button "Add"
    expect(page).to have_content('Album title')
  end

  scenario 'User is able to see all albums' do
    visit '/albums/new'
    fill_in "album_title", with: "Album title"
    click_button "Add"
    click_link "New Album"
    fill_in "album_title", with: "Album title 2"
    click_button "Add"
    expect(page).to have_content('Album title')
    expect(page).to have_content('Album title 2')
  end

  scenario 'User is able to see all albums' do
    visit '/albums/new'
    fill_in "album_title", with: "Album title"
    click_button "Add"
    click_link "New Album"
    fill_in "album_title", with: "Album title 2"
    click_button "Add"
    expect(page).to have_content('Album title')
    expect(page).to have_content('Album title 2')
  end
end
