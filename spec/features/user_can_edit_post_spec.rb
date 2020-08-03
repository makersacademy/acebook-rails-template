require 'rails_helper'

RSpec.feature "Edit ", type: :feature do
  scenario "Can edit own post and view the updated post" do
    signup
    login
    click_link "New post"
    fill_in "post[message]", with: "Hello, world!"
    click_button "Create Post"
    click_link "Back"
    click_link "Edit"
    fill_in "post[message]", with: "Hello, world"
    click_button "Update Post"
    expect(page).to have_content("Hello, world")
  end
end
