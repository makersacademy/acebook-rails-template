require 'rails_helper'

RSpec.feature "Likes", type: :feature do
  scenario "Can see the 'like' emoji next to a post" do
    sign_up(email: "test@test.com", password: "password")
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content(:smiley)
  end

  scenario "Can click the like emoji" do
    sign_up(email: "test@test.com", password: "password")
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_button Emoji.find_by_alias("smiley").raw
    expect(page).to have_content('1')
  end

  scenario "Can click the like emoji" do
    sign_up(email: "test@test.com", password: "password")
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_button Emoji.find_by_alias("smiley").raw
    click_button Emoji.find_by_alias("smiley").raw
    expect(page).to have_content('1')
    expect(page).to have_content('You have already liked this post')
  end
end
