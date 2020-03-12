require 'rails_helper'

RSpec.feature "View Your Posts", type: :feature do
  scenario "new user can't see posts on their page" do
    visit "/users/new"
    fill_in "Email", with: "posttest@example.com"
    fill_in "Password", with: "passw0rd"
    click_button "Submit"
    expect(page).to have_content("You have no posts... :(")
    expect(page).not_to have_content("Email")
  end
  scenario "user signs up, creates a post, and can see it on their page" do
    visit "/users/new"
    fill_in "Email", with: "posttest@example.com"
    fill_in "Password", with: "passw0rd"
    click_button "Submit"
    expect(page).to have_content("You have no posts... :(")
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "On my momma I be breathing"
    click_button "Submit"
    expect(page).to have_content("On my momma I be breathing")
    visit"/posts/yours"
    expect(page).to have_content("On my momma I be breathing")
    expect(page).not_to have_content("You have no posts... :(")
  end
end
