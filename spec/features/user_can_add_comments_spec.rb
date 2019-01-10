require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  before :each do
    createUser()
    signin()
    postMessage()
  end

  scenario "Can leave a comment on a post and view them" do
    click_link "Comment"
    fill_in "comment_content", with: "Test comment"
    click_button "Submit"
    expect(page).to have_content "Test comment"
  end

  scenario "Can edit a comment" do
    click_link "Comment"
    fill_in "comment_content", with: "Test comment"
    click_button "Submit"
    all('a', :text => 'Edit')[1].click
    fill_in "comment_content", with: "Changed comment"
    click_button "Submit"
    expect(page).to have_content "Changed comment"
  end

  scenario "Can delete a comment" do
    click_link "Comment"
    fill_in "comment_content", with: "No comment"
    click_button "Submit"
    all('a', :text => 'Delete')[1].click
    expect(page).not_to have_content "No comment"
  end
end
