require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  include ActiveSupport::Testing::TimeHelpers

  scenario "Can see the time of date of a post" do
    travel_to Time.zone.local(1988, 8, 11, 00, 00, 00)
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("11 August at 0:00")
  end
end
