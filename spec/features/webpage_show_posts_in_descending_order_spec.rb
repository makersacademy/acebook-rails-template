require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "User sees posts in descending order" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "First message!"
    click_button "Submit"
    click_link "New post"
    fill_in "Message", with: "Second message!"
    click_button "Submit"
    expect(page).to have_content("date:2020-01-14 post:Second message! date:2020-01-14 post:First message! New post")
  end
end
