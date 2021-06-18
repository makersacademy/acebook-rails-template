require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

  scenario "Last post is on top" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Message 1"
    click_button "Submit"
    click_link "New post"
    fill_in "Message", with: "Message 2"
    click_button "Submit"
    expect(page.find('p:nth-of-type(1)')).to have_content("Message 2")
  end
end
