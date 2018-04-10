require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    click_link "New post"
    fill_in "Post a new message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

  scenario "Can like a post and see like count" do
    #Arrange
    visit "/posts"
    click_link "New post"
    fill_in "Post a new message", with: "Hello, world!"
    click_button "Submit"
    #Action
    click_button("post_like_0")
    #Assert
    expect(page).to have_content("Likes: 1")
  end
end

RSpec.feature "Links", type: :feature do
  scenario "Redirected to the Posts page when you click on the link" do
    visit "/"
    click_link "Go to Posts page"
    expect(page).to have_content("Welcome to your Acebook newsfeed!")
  end
end
