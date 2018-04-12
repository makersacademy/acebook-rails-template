require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  scenario "Can comment on posts and view them" do
    visit "/posts"
    fill_in "body", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
end
