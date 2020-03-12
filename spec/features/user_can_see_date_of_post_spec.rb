require 'rails_helper'

RSpec.feature "Timeline", type: :feature do

  scenario "Can see the time of date of a post" do

    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("#{Time.now}")
  end
end