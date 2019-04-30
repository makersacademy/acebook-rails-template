require 'rails_helper'
require 'sign_up_helper'

RSpec.feature "Like posts", type: :feature do
  scenario "User can like a post" do
    create_user_and_sign_up
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Test message!"
    click_button "Submit"
    click_button "🐟"
    expect(page).to have_css("#number_of_likes", text: "1")
  end

  xscenario "User can unlike a post they previously liked" do
    create_user_and_sign_up
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Test message!"
    click_button "Submit"
    click_button "🐟"
    click_button "🐟"
    expect(page).to have_css("#number_of_likes", text: "0")
  end
end