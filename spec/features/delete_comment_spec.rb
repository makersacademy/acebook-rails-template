require 'rails_helper'

RSpec.feature "Deleting comments", type: :feature do

  before(:each) do
    sign_up
    add_post
    click_link "View Comments"
    fill_in "comment[content]", with: "I am comment#1"
    click_button "Create Comment"
  end

  scenario "Can delete comments" do
    click_link "Delete"
    expect(page).not_to have_content("I am comment#1")
  end

  scenario "Can't delete other's comments" do
    click_link "Back"
    click_link "Logout"
    sign_up("test2@test2.com")
    click_link "View Comments"
    expect(page).not_to have_content("Delete comment")
  end

end
