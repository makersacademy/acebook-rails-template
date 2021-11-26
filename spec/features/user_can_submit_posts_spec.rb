require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    click_link "Write a post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

  scenario "User can like a post" do
    visit "/posts"
    click_link "Write a post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_button ("Likes")
    expect(page).to have_button("1 Likes")
  end 

  scenario 'Posts are displayed in descending order' do
    visit '/posts'
    click_link "Write a post"
    fill_in "Message", with: "First post"
    click_button "Submit"
    click_button ("Likes")
  end

end
