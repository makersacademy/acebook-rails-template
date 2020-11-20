require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    add_new_user
    click_link("New post")
    fill_in 'message', with: "Hello, world!"
    click_button("Submit")
    expect(page).to have_content("Hello, world!")
    add_new_user("Test Man", "test2@testing.com")
    fill_in 'comment_text', with: "Hi I am Test Man"
    click_button("Comment")
    expect(page).to have_content("Hi I am Test Man")
  end
end
