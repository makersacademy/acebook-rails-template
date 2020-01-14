require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "User sees posts in descending order" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "First messege!"
    click_button "Submit"
    click_link "New post"
    fill_in "Message", with: "Second messege!"
    click_button "Submit"
    p(page)
    expect(page).to have_content("date:2020-01-14 post -- Second messege! date:2020-01-14 post -- First messege! New post")
  end
end
