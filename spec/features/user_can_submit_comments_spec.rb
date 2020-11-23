require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit comments and view them" do
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

  scenario "Comments are in descending order" do
    add_new_user
    click_link("New post")
    fill_in 'message', with: "Hello, world!"
    click_button("Submit")
    expect(page).to have_content("Hello, world!")
    add_new_user("User1", "test2@testing.com")
    fill_in 'comment_text', with: "Comment 1"
    click_button("Comment")
    fill_in 'comment_text', with: "Comment 2"
    click_button("Comment")
    expect("Comment 2").to appear_before "Comment 1"
  end




end
