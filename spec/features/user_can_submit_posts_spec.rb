require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
end

RSpec.feature "Feed", type: :feature do
  scenario "second message shows first" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link "New post"
    fill_in "Message", with: "Hello, world! 2"
    click_button "Submit"
    expect(Post.all.reverse.first.message).to eq("Hello, world! 2")
  end
end

RSpec.feature "See the time of the post", type: :feature do
  scenario "we can see when a post was published" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content(Post.all.reverse.first.created_at.strftime("%d/%m/%Y" + "  " + "%k:%M %p"))
  end
end