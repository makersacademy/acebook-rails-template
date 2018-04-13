require 'rails_helper'

RSpec.feature "Commenting", type: :feature do

  before(:each) do
    visit "/users/sign_up"
    fill_in "user[email]", with: "test@test.com"
    fill_in "user[password]", with: "testtest"
    fill_in "user[password_confirmation]", with: "testtest"
    click_button "Sign up"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link "View Comments"
    fill_in "comment[content]", with: "I am comment#1"
    click_button "Create Comment"
  end

  scenario "Can create comment and view immediately" do
    expect(page).to have_content("I am comment#1")
  end

  scenario "Can create comment, go back, go to comments and view" do
    click_link "Back"
    click_link "View Comments"
    expect(page).to have_content("I am comment#1")
  end

  scenario "Comments are sorted by ascending age" do
    fill_in "comment[content]", with: "I am comment#2"
    click_button "Create Comment"
    alltext = page.body
    i1 = alltext.index('I am comment#1')
    i2 = alltext.index('I am comment#2')
    expect(i2 < i1).to eq true
  end

  scenario "comment count is shown" do
    fill_in "comment[content]", with: "I am comment#2"
    click_button "Create Comment"
    click_link "Back"
    expect(page).to have_content("2 Comments")
  end
end
