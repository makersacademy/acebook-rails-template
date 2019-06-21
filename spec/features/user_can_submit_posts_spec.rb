require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    signup
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

  scenario "Can submit posts across multiple lines" do
    signup
    click_link "New post"
    fill_in "Message", with: "Hello, world
    this is a second line"
    click_button "Submit"
    expect(page).to have_content("Hello, world
      this is a second line")
  end
end
