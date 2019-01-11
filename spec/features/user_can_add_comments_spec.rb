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

  scenario "Can't edit/delete someone else's comments" do
    click_link "Comment"
    fill_in "comment_content", with: "Test comment"
    click_button "Submit"
    signout()
    createUser(email: "hello@mail.com")
    signin(email: "hello@mail.com")
    expect(page).not_to have_content "Edit"
    expect(page).not_to have_content "Delete"
  end

  scenario "Can delete another person's comment on own post" do
    signout()
    createUser(email: "hello@mail.com")
    signin(email: "hello@mail.com")
    click_link "Comment"
    fill_in "comment_content", with: "Test comment"
    click_button "Submit"
    signout()
    signin()
    expect(page).to have_content "Test comment"
    all('a', :text => "Delete")[1].click
    expect(page).not_to have_content "Test comment"
  end
end
