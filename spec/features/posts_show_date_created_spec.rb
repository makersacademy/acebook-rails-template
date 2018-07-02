require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
    before do
        now = Time.zone.parse("Apr 17, 2018, 12:00PM")
        Timecop.freeze(now)
    end
  scenario "Posts can have multiple lines" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!\n This is a post with multiple \n lines"
    click_button "Submit"
    expect(page).to have_content("Hello, world!\n This is a post with multiple \n lines")
    expect(Time.zone.now).to have_content("2018-04-17 12:00:00 UTC")
  end
end
