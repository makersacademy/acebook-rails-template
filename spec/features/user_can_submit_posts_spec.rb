require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts/new"
    fill_in "Message", with: "Hello, world!"
    click_button "Create new post"
    expect(page).to have_content("Hello, world!")
  end

  scenario "Can submit a post and like it, and see increased number of likes" do
    visit "/posts/new"
    fill_in "Message", with: "Hello, world!"
    click_button "Create new post"
    click_link("Like", match: :first)
    expect(page).to have_content("1 like")
    click_link("Like", match: :first)
    expect(page).to have_content("2 likes")
  end

  scenario "Can edit posts" do
    visit "/posts/new"
    fill_in "Message", with: "Hello, world!"
    click_button "Create new post"
    click_link("Edit", match: :first)
    fill_in "Message", with: "Hello, Earth!"
    click_button "Create new post"
    expect(page).to have_content("Hello, Earth!")
  end

  scenario "Can delete posts" do
    visit "/posts/new"
    fill_in "Message", with: "Hello, world!"
    click_button "Create new post"
    save_and_open_page
    click_link("Delete", match: :first)
    expect(page).not_to have_content("Hello, world!")
  end

  scenario " Can add comment" do
    visit "/posts/new"
    fill_in "Message", with: "Hello, world!"
    click_button "Create new post"
    click_button "Comment"
    fill_in "Comment message", with: "Hello, comment!"
    click_link "Submit"
    expect(page).to have_content("Hello, comment!")
  end

end
