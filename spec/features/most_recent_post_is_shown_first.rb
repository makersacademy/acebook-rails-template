require 'rails_helper'

RSpec.feature "Feed", type: :feature do
  scenario "second message shows first" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world! 2"
    click_button "Submit"
    expect(Post.all.reverse.first).to eq("Hello, world! 2")
  end
end
