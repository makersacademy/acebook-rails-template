require 'rails_helper'

RSpec.feature "Editing", type: :feature do

  before(:each) do
    sign_up
    add_post
  end

  scenario "Can edit posts" do
    click_link "Edit"
    fill_in "post[message]", with: "Changed text"
    click_button "Submit"
    expect(page).to have_content("Changed text")
    expect(page).not_to have_content("Hello, world!")
    expect(page).to have_current_path("/posts")
  end

  scenario "Can edit posts" do
    click_link 'Logout'
    sign_up("test2@test.com", "test2")
    click_link "View Comments"
    expect(page).not_to have_link("Edit")
    expect(page).not_to have_link("Delete")
  end
end
