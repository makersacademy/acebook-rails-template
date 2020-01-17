require 'rails_helper'

RSpec.feature "Timeline", type: :feature do

  before do
    sign_up("email@example.com", "pass12", "pass12")
    click_button "New post"
  end

  scenario "Can submit posts and view them" do
    fill_in "Message", with: "Hello, world!"
    post_time = Time.now
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("Date posted: #{post_time.strftime('%d %B %Y at %l:%M %p')}")
    expect(page).to have_content("Posted by email@example.com")
  end

  scenario "posts are ordered reverse chronologically" do
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"

    click_button "New post"
    fill_in "Message", with: "Hello again, world!"
    click_button "Submit"

    expect(first('.post')).to have_content "Hello again, world!"
  end
end
