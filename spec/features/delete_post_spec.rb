require 'rails_helper'

RSpec.feature "Delete", type: :feature do 
  scenario 'user can delete a post' do 
    visit "/"
    click_on "Sign up"
    fill_in "Email", with: "user@test.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Confirm"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
    click_link "Delete"
  end 
end 