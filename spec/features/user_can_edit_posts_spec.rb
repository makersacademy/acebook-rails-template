require 'rails_helper'

RSpec.feature "Editing", type: :feature do
  scenario "Can edit posts" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link "Edit"
    # binding.pry
    fill_in "post[message]", with: "Changed text"
    click_button "Submit"
    expect(page).to have_content("Changed text")
    expect(page).not_to have_content("Hello, world!")
    expect(page).to have_current_path("/posts")
  end
end
