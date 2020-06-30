require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

  scenario "Can see the last updated time for a post" do
    visit "/posts"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content(Time.now.strftime("%F %H:%M"))
  end

  scenario "the page displays the newest message first" do
    visit "/posts"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    fill_in "Message", with: "I should be displayed first!"
    click_button "Submit"
    expect(first("p")).to have_content("I should be displayed first!")
  end
end
