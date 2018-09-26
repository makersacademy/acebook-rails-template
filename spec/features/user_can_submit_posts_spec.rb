require 'rails_helper'
include ActiveSupport::Testing::TimeHelpers

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
    expect(page).to have_content(Time.current.strftime("%l:%M %p - %e %b '%y"))
  end

  scenario "User cannot post empty message" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: ""
    click_button "Submit"
    expect(page).to have_field("Message")
    expect(page).to have_content("Message can't be blank")
  end
end
