require 'rails_helper'
require "webhelper"

# RSpec.feature "Timeline", type: :feature do
#   scenario "empty posts raise error" do
#     visit "/posts"
#     click_link "New post"
#     fill_in "Message", with: ""
#     click_button "Submit"
#     expect(page).to raise_error
#   end
# end

feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    go_homepage
    sign_up
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
end
