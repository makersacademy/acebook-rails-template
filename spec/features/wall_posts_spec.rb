require 'rails_helper'

RSpec.feature "Wall Posts", type: :feature do
  scenario "Submit posts with a wall id" do
    signup
    click_on "New Post"
    fill_in "Message", with: "This posts on Ben's wall!"
    click_button "Submit"
    expect(current_path).to eq "/#{my_user_id("ben@example.com")}"
    expect(page).to have_content "This posts on Ben's wall!"
  end

  scenario "Submit post to another user's wall" do
    signup_user("Eve", "eve@example.com", "password")
    click_on "Logout"
    signup
    expect(current_path).to eq "/#{my_user_id("ben@example.com")}"

    visit "/#{my_user_id("eve@example.com")}"
    expect(current_path).to eq "/#{my_user_id("eve@example.com")}"
    click_on "New Post"
    fill_in "Message", with: "This posts on Eve's wall!"
    click_button "Submit"
    expect(current_path).to eq "/#{my_user_id("eve@example.com")}"
    expect(page).to have_content "This posts on Eve's wall!"

    visit "/#{my_user_id("ben@example.com")}"
    expect(page).not_to have_content "This posts on Eve's wall!"
  end


end
