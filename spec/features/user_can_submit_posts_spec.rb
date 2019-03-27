require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
  scenario "Can see the newest post first" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "First"
    click_button "Submit"
    click_link "New post"
    fill_in "Message", with: "Second"
    click_button "Submit"
    first = page.first(".msg").text
    expect(first).to eq("Second")
  end
end
