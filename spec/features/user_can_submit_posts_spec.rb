require 'rails_helper'
require 'web_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    log_in
    visit "/posts"
    click_link "new post"
    fill_in "Message", with: "I am not seeded"
    click_button "Submit"
    expect(page).to have_content("I am not seeded")
  end
end
