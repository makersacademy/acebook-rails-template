require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "User can submit a post and posts are sorted in a DESC order" do
    user_sign_up
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"

    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Bye, world!"
    click_button "Submit"

    expect(page.all('.post').first.text).to include("Bye, world!")
  end
end
