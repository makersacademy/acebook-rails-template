require 'rails_helper'
require 'web_helper'

RSpec.feature "Update posts", type: :feature do
  scenario "User can update post" do
    log_in
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
    page.find('#posts li:first-child').click_button('Edit')
    fill_in "post_message", with: "This is updated"
    click_button "Submit"
    expect(page).to have_content("This is updated")
  end
end
