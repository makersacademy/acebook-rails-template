require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end


  scenario "Posts are ordered - newest at the top" do
    visit "/posts"

    click_link "New post"
    fill_in "Message", with: "First, hello!"
    click_button "Submit"

    click_link "New post"
    fill_in "Message", with: "Second, hello!"
    click_button "Submit"
    
    expect(first('.box')).to have_content("Second, hello!")
  end

  scenario "Posts have timestamps" do
    visit "/posts"
    
    click_link "New post"
    fill_in "Message", with: "First, hello!"
    click_button "Submit"
    time = Post.all[0].created_at.strftime("%Y-%m-%d %H:%M")
    
    expect(first('.box')).to have_content(time)
  end
end
