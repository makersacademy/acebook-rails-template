require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  include ActiveSupport::Testing::TimeHelpers

  scenario "Can see the time of date of a post" do
    user_sign_up
    travel_to Time.zone.local(2020, 3, 12, 00, 00, 00)

    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"

    expect(page).to have_content("2020-03-12 00:00:00 UTC")
  end
end
