require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can edit posts" do
    visit "/posts"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link "Edit"
    fill_in "Message", with: "Hello, world editted!"
    click_button "Submit"
    expect(page).to have_content("Hello, world editted!")
  end
end