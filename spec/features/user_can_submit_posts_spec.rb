require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/welcome"
    click_button "Sign Up"
    fill_in "Name", with: "Bob"
    fill_in "Email", with: "bob@test.com"
    fill_in "Password", with: "Bobobob"
    click_button "Create User"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
end
