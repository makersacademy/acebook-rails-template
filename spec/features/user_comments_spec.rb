require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Shows time comment was created" do
    signup_and_login
    fill_in "Message", with: "Hello, world!"
    click_button "Create Post"
    fill_in "Comment", with: "Hi!"
    click_button "Create Comment"
    expect(page).to have_content(Time.now.to_formatted_s(:long))
  end
  scenario "Shows username on comment" do
    signup_and_login
    fill_in "Message", with: "Hello, world!"
    click_button "Create Post"
    click_link "Log Out"
    signup_and_login_2
    fill_in "Comment", with: "Hi!"
    click_button "Create Comment"
    expect(page).to have_content("user2")
  end

end