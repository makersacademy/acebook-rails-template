require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    add_new_post
    expect(page).to have_content("Hello, world!")
  end

  scenario "Can like a post and see like count" do
    #Arrange
    add_new_post
    #Action
    click_link("Show")
    click_link("Like")
    #Assert
    expect(page).to have_content("Like 1")
  end
end

RSpec.feature "Links", type: :feature do
  scenario "Redirected to the Posts page when you click on the link" do
    visit "/"
    click_link "Go to Posts page"
    expect(page).to have_content("Welcome to your Acebook newsfeed!")
  end
end
