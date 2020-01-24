require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "User sees posts in descending order" do
    signup
    click_on "New Post"
    fill_in "Message", with: "My wall post"
    click_button "Submit"
    expect(current_path).to eq "/#{my_user_id("ben@example.com")}"
    expect(page).to have_content "My wall post"
    click_on "logout"
    signup_user("Example", "Example@example.com", "password")
    visit '/posts'
    expect(page).to have_content 'Ben'
    expect(page).to have_content "My wall post"
  end
end
