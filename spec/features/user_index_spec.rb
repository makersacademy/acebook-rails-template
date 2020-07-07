require 'rails_helper'

RSpec.feature "wall", type: :feature do
  scenario "user goes users list" do
    sign_up_with('email@eamil', 'testingName', "password")
    visit users_path
    expect(page).to have_content('testingName')
  end

  scenario "user list has links to walls" do
    sign_up_with('email@eamil', 'testingName', "password")
    visit users_path
    click_link 'testingName'
    expect(page).to have_content('wall of... testingName')
  end

end
