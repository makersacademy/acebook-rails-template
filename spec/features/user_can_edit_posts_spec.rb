require 'rails_helper'

RSpec.feature "Editing", type: :feature do
  scenario "Can edit posts" do
    sign_up
    add_post
    click_link "Edit"
    # binding.pry
    fill_in "post[message]", with: "Changed text"
    click_button "Submit"
    expect(page).to have_content("Changed text")
    expect(page).not_to have_content("Hello, world!")
    expect(page).to have_current_path("/posts")
  end
end
