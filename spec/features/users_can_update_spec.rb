require 'rails_helper'

RSpec.feature "Update", type: :feature do
  scenario "Can update posts" do
    create_post

    click_link "Update"
    fill_in "Message", with: "Hello, world changed!"
    click_button "Update"
    expect(page).to have_content("Hello, world changed!")
  end
end