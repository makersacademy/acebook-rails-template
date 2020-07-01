require 'rails_helper'

def creates_a_post
  visit "/posts"
  click_link "New post"
  fill_in "Message", with: "Hello, world!"
  click_button "Submit"
end

def creates_a_post2
  visit "/posts"
  click_link "New post"
  fill_in "Message", with: "Hello, again"
  click_button "Submit"
end

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    sign_in
    creates_a_post
    expect(page).to have_content("Hello, world!")
  end

  scenario "Can submit posts and view date" do
    sign_in
    creates_a_post
    expect(page).to have_content("#{Time.now.strftime("%Y-%m-%d")}")
  end

  xscenario "Can submit posts and view time" do
    creates_a_post
    expect(page).to have_content("#{Time.now.strftime("%k:%M")}")
  end

  scenario "Order of posts based on time created" do
    sign_in
    creates_a_post
    creates_a_post2
    expect(page).to have_content(/Hello, again.*Hello, world!/)
  end

  xscenario "A post can be added with line breaks" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with:
    "I am a post.\r\nOne which has new lines"
    click_button "Submit"
    expect(find('#body').text).to eq("I am a post.\nOne which has new lines")
  end
end
