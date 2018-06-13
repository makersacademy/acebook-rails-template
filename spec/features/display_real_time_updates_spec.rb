require 'rails_helper'

RSpec.feature "Notifications", type: :feature do
  scenario "User can see real time updates of all other posts", :notifications do
    Time.zone = 'London'
    new_time = Time.local(2016, 6, 1, 12, 0, 0).strftime("%e %B %Y %H:%M")
    Timecop.freeze(new_time)
    sign_up_and_sign_in
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Post was created at #{new_time}")
  end
end
