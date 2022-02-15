require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can delete posts" do
    sign_up_user
    visit "/posts"
    click_link "New Post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"

    click_link "Delete"
    expect(page).to_not have_content("Hello, world!")
  end
end
