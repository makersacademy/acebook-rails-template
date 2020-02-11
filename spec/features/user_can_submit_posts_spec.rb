require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view posts, date, time and username" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("iluvcatz123")
    expect(page).to have_content(Time.now.strftime("%m/%d/%Y, %H:%M"))
  end
end
