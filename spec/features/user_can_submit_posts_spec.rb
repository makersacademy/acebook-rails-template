require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    click_link "Sign Up"
    fill_in "Email", with: "mrtester@test.com"
    fill_in "Password", with: "test123"
    fill_in "Password confirmation", with: "test123"
    click_button "Sign Up"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
end
