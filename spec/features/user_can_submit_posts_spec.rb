require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    click_link "add new post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end


  scenario "Can submit posts and view them in correct order" do
    visit "/posts"
    click_link "add new post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link "add new post"
    fill_in "Message", with: "Hello, world2!"
    click_button "Submit"
    expect(page).to have_content 'world2'
  end
end
