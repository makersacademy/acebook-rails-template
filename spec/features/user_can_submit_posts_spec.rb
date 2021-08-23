require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

  scenario "Can submit posts and with images view them" do
    visit "/posts"
    click_link "New post"
    fill_in "post[message]", with: "Hello, world!"
    attach_file("post[image]", './spec/files/attachment.jpeg')
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
    expect(page).to have_css("img[src*='attachment.jpeg']")
  end

  scenario "Gives error message if post empty" do
    visit "/posts"
    click_link "New post"
    click_button "Submit"
    expect(page).to have_content("Cannot create an empty post.")
  end
end