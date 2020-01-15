require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    sign_up("email@example.com", "pass12", "pass12")
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    post_time = Time.now
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("Date posted: #{post_time.strftime('%d %B %Y at %I:%M %p')}")
    expect(page).to have_content("Posted by email@example.com")
  end

  scenario "posts are ordered reverse chronologically" do
    sign_up("email@example.com", "pass12", "pass12")
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"

    click_link "New post"
    fill_in "Message", with: "Hello again, world!"
    click_button "Submit"

    expect(first('.post')).to have_content "Hello again, world!"
  end
end
