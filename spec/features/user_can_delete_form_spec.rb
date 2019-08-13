require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hi"
    click_button "Submit"
    visit '/posts'
    click_on "Delete"
    expect(page).not_to have_content("Hi")
  end
end
