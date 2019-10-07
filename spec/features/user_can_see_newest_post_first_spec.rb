require 'rails_helper'

RSpec.feature "Timeline order", type: :feature do
  scenario "shows newest post first" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Newest message"
    click_button "Submit"

    expect(page.find('p:nth-child(1)')).to have_content "Newest message"
  end
end
