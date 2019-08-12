require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can edit posts and view updated post" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"

    click_link "Edit"
    fill_in "post[message]", with: "Hi, world!"
    click_button "Submit"
    expect(page).to have_content("Hi, world!")
  end
end
