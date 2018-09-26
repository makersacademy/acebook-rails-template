require 'rails_helper'

RSpec.feature "Timeline", type: :feature do

  scenario "Posts appear with time and the date created" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Test Post"
    click_button "Submit"

    converted_time = convert_time_check # feature_helper method

    expect(page).to have_content(converted_time)
  end
end
