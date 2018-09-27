require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Posts appear with newest post first" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Older Post"
    click_button "Submit"
    click_link "New post"
    fill_in "Message", with: "Newest Post"
    click_button "Submit"
    page.body.index("Newest Post").should < page.body.index("Older Post")
  end
end
