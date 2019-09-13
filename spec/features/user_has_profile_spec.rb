require "rails_helper"

RSpec.feature "Profile", type: :feature do
  scenario "Can view their own profile" do
    sign_in
    visit "/profile"
    expect(page).to have_content("Welcome to ConnectU")
  end
  scenario "User can add post and view it on their profile" do
    sign_in
    visit "/profile"
    click_on "New Post"
    fill_in "post_message", with: "My new post"
    click_on "Submit"
    visit "/profile"
    expect(page).to have_content("My new post")
  end
end
