require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/welcome"
    click_button "Sign Up"
    fill_in "Username", with: "jooomin"
    fill_in "Password", with: "123"
    click_button "Create User"
    click_button "Login"
    fill_in "Username", with: "jooomin"
    fill_in "Password", with: "123"
    click_button "Login"
    click_button "Posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
end
