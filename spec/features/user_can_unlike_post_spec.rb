require 'rails_helper'

RSpec.feature "Unlike", type: :feature do
  scenario "Can unlike a post" do
    sign_up(email: "test@test.com", password: "password")
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_button Emoji.find_by_alias("thumbsup").raw
    click_button Emoji.find_by_alias("thumbsdown").raw

    expect(page).to have_content('0 Likes')
    expect(page).to have_content(:thumbsup)
  end
end
