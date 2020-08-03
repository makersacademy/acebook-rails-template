require 'rails_helper'

RSpec.feature "Edit ", type: :feature do
  scenario "Can edit own post and view the updated post" do
    visit "/"
    click_button "Sign Up"
    fill_in "user[email]", with: "test@test.com"
    fill_in "user[password]", with: "123456"
    click_button "Save User"
    click_button "Login"
    fill_in "email", with: "test@test.com"
    fill_in "password", with: "123456"
    click_button "Login"
    click_link "New post"
    fill_in "post[message]", with: "Hello, world!"
    click_button "Create Post"
    click_link "Back"
    click_link "Edit"
    fill_in "post[message]", with: "Hello, world"
    click_button "Update Post"
    expect(page).to have_content("Hello, world")
  end
end