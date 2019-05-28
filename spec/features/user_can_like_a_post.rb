require 'rails_helper'

RSpec.feature "Likes", type: :feature do
  scenario 'User can like a post once' do
    visit "/users/new"
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Doe"
    fill_in "Email", with: "john@doe.com"
    fill_in "Password", with: "john1234"
    click_button 'Submit'
    fill_in "Email", with: "john@doe.com"
    fill_in "Password", with: "john1234"
    click_button 'Submit'
    click_link "New post"
    fill_in "New", with: "Hello, world!"
    click_button "Post"

    expect(page).not_to have_content("Hello, world!")
  end
