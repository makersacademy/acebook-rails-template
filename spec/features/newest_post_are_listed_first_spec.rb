require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "User can submit a post and posts are sorted in a DESC order" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"

    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Bye, world!"
    click_button "Submit"

    expect(page.first('p').text).to include("Bye, world!")
  end
end
