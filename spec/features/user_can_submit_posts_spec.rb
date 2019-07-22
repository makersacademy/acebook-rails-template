require 'rails_helper'

RSpec.feature "New post", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    click_link "New post"
    fill_in "post[message]", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

  scenario "Can raise error message if less than 5 chars" do
    visit "/posts"
    click_link "New post"
    fill_in "post[message]", with: "Hi"
    click_button "Submit"
    expect(page).to have_content("1 error prohibited this post from being saved:")
    expect(page).to have_content("Message is too short (minimum is 5 characters)")
  end

  scenario "Can raise error message if blank" do
    visit "/posts"
    click_link "New post"
    fill_in "post[message]", with: ""
    click_button "Submit"
    expect(page).to have_content("2 errors prohibited this post from being saved:")
    expect(page).to have_content("Message can't be blank")
  end

  scenario "Can create new post and view them in a list" do
    visit "/posts"
    click_link "New post"
    fill_in "post[message]", with: "Post 1"
    click_button "Submit"
    # click_link "Back"
    expect(page).to have_content("Post 1")
  end

  scenario "Can create new post and edit it" do
    visit "/posts"
    click_link "New post"
    fill_in "post[message]", with: "Post 1"
    click_button "Submit"

    click_link "Edit"
    fill_in "post[message]", with: "Post 2"
    click_button "Submit"
    expect(page).to have_content("Post 2")
  end

end
