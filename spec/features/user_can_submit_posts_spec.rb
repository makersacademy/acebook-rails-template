require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  before :each do
    visit "/users/sign_in"
    fill_in "Email", with: "hello@test.com"
    fill_in "Password", with: "hello2"
    click_button "Log in"
  end

  scenario "Can submit posts and view them" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

  scenario "Can edit a post and see it" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link "Edit"
    fill_in "Message", with: "goodbuy"
    click_button "Submit"
    expect(page).to have_content("goodbuy")
  end

  scenario "Can add a post and delete it" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link "Delete"
    expect(page).not_to have_content("Hello, world!")
  end

end
