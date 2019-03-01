require 'rails_helper'
require 'web_helper'

RSpec.feature "Update posts", type: :feature do
  scenario "User can update post" do
    log_in
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
    first('.item').click_button('Edit')
    fill_in "UpdatePost", with: "This is updated"
    expect(page).to have_content("This is updated")
  end
end
