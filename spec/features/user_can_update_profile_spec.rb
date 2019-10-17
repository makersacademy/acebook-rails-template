require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can update their profile" do
    register
    visit "/posts"
    click_link "Update profile"
    fill_in "Email", with: "post-toast@example.com"
    fill_in "Password", with: "1234"
    click_button "Update User"
    expect(page).to have_content("Signed in as: post-toast@example.com")
  end
end
