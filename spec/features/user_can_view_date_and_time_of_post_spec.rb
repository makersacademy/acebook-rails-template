require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can view date and time of post" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    now = DateTime.now

    expect(page).to have_content(now.strftime("%C%y-%m-%d %H:%M:%S"))
  end
end
