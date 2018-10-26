require 'rails_helper'

RSpec.feature "Post", type: :feature do
  scenario "Can submit posts and view them" do
    postAndClick
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

  scenario "Can add posts with newlines" do
    postAndClick
    fill_in "Message", with: "Hello\nNewLine here"
    click_button "Submit"
    expect(page).to have_content("Hello\nNewLine here")
  end

end
