require "rails_helper"

RSpec.feature "Timeline", type: :feature do
  scenario "Can edit posts and view them" do
    # TODO: add login helper method
    sign_in
    visit "/posts"
    click_button "New Post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_button "Edit Post"
    fill_in "Message", with: "Hello, Dream world!"
    click_button "Submit"
    expect(page).to have_content("Hello, Dream world!")
  end
  scenario "Can't edit post after 10 mins" do
    travel_to Time.local(1994)
    sign_in
    visit "/posts"
    click_button "New Post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    travel_to Time.local(1994) + 601
    click_button "Edit Post"
    fill_in "Message", with: "Hello, Dream world!"
    click_button "Submit"
    expect(page).to have_content("You can't edit your post after 10 mins foooool, gotta delete it mate")
  end
  scenario "User can't see edit post button after 10 mins" do
    travel_to Time.local(1994)
    sign_in
    visit "/posts"
    click_button "New Post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    travel_to Time.local(1994) + 601
    expect(page).not_to have_selector("Edit Post")
  end
end
