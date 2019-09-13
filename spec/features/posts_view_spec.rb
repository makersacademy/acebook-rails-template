require 'rails_helper'
require "support/features/clearance_helpers"

RSpec.feature "Post", type: :feature do

  before(:each) do
    sign_in
  end

  scenario "Posts have a timestamps" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("UTC")
  end

  scenario "Posts with mutliple lines are displayed in multiple lines" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!\nThis is a new line\nAnd another line."
    click_button "Submit"
    expect(page).to have_selector("p", text: "Hello, world!")
    expect(page).to have_selector("p", text: "This is a new line")
    expect(page).to have_selector("p", text: "And another line.")
    expect(page).not_to have_selector("p", text: "Hello, world!\nThis is a new line\nAnd another line.")
  end

  scenario ""
end
