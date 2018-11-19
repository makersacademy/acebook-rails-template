require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can see posts with a time created" do
    visit '/posts'
    click_link 'New post'
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    time_now = Time.now()
    expect(page).to have_content(time_now.strftime("%eth %b %Y %T"))
  end
end
