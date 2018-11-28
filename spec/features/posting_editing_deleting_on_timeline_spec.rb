require 'rails_helper'
require_relative '../web_helpers.rb'

RSpec.feature "Timeline - edit and delete", type: :feature do

  before do
    visit_site_sign_up
    @timeline_url =  current_url
    hello_world_timeline_post
    visit @timeline_url
  end

  scenario "Can post on a wall" do
    expect(page).to have_content("Hello, world!")
  end

  scenario "Can delete a post on a wall" do
    click_link 'Delete'
    visit @timeline_url
    expect(page).not_to have_content 'Hello, world!'
    expect(page).to have_content "username123's wall"
  end

  scenario "Can edit a post on wall" do
    edit_post
    expect(page).to have_content "Goodbye, world!"
  end

  scenario "Cannot delete or edit a post on a wall if the user is not the wall owner" do
    sign_out
    sign_up_other_user
    visit @timeline_url
    expect(page).to have_content 'Hello, world!'
    expect(page).not_to have_link "Delete"
    expect(page).not_to have_link "Edit"
  end

end
