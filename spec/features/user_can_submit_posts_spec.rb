require 'rails_helper'

TIMESTAMP = Time.now
FORMATTED_TIME = TIMESTAMP.strftime("%k:%M %d.%m.%y")

RSpec.feature "Timeline", type: :feature do

  scenario "Can submit posts and view them" do

    visit "/"
    click_link "Sign Up"
    fill_in "user[username]", with: "Stephen"
    fill_in "user[email]", with: "stephen@test.com"
    fill_in "user[password_string]", with: "stephenisntreal"
    click_button "Create Account"
    visit "/posts"
    fill_in 'post[message]', with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("Added at #{FORMATTED_TIME}")
  end
end
