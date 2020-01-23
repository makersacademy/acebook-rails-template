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
end