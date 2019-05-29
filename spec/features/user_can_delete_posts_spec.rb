require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and delete them" do
    sign_up_and_login
    click_link "New post"
    fill_in "New", with: "Hello, world!"
    click_button "Post"
    click_link "Delete"
    expect(page).not_to have_content("Hello, world!")
  end
end
