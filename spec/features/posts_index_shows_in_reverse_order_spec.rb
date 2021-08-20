require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "posts are viewed in reverse order" do
    visit "/posts/new"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    visit "/posts/new"
    fill_in "Message", with: "Hello, again!"
    click_button "Submit"
    
    posts = page.all(".post-content")
    expect(posts[0]).to have_content "Hello, again!"
    expect(posts[1]).to have_content "Hello, world!"
  end
end