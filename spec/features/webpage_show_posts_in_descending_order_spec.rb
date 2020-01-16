require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "User sees posts in descending order" do
    signup
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "First message!"
    click_button "Submit"
    click_link "New post"
    fill_in "Message", with: "Second message!"
    click_button "Submit"
    expect(page).to have_content("date:#{Time.now.strftime("%Y-%m-%d")} post:Second message! date:#{Time.now.strftime("%Y-%m-%d")} post:First message!")
  end
end
