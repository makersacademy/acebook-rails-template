require 'rails_helper'

RSpec.feature "Deleting comments", type: :feature do

  before(:each) do
    sign_up
    add_post
    click_link "Hello, world!"
    fill_in "comment[content]", with: "I am comment#1"
    click_button "New Comment"
  end

  scenario "Can delete comments" do
    within(find("div#comment_0")) do
      click_link "Delete"
    end
    expect(page).not_to have_content("I am comment#1")
  end

  scenario "Can't delete other's comments" do
    click_link "Back"
    click_link "Logout"
    sign_up(email = "test4@test.com", username = "test4")
    click_link "Hello, world!"
    expect(page).not_to have_content("Delete comment")
  end

end
