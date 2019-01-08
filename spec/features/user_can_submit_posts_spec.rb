require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

  scenario "Can edit a post and see it" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link "Edit"
    fill_in "Message", with: "goodbuy"
    click_button "Submit"
    expect(page).to have_content("goodbuy")
  end

  scenario "Can add a post and delete it" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link "Delete"
    expect(page).not_to have_content("Hello, world!")
  end

end
