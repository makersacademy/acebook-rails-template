require "rails_helper"
require "date"

RSpec.feature "Posts with dates in reverse order", type: :feature do
  scenario "Can view posts with dates, in order" do
    sign_up
    date = DateTime.now
    date = date.strftime("%d-%m-%Y")
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Message 1"
    click_button "Submit"
    click_link "New post"
    fill_in "Message", with: "Message 2"
    click_button "Submit"
    expect(page).to have_content("Message 2 updated on #{date}\nMessage 1 updated on #{date}")
  end
end
