require 'rails_helper'

RSpec.feature "Users can delete their own posts", type: :feature do
  scenario "delete option appears on own post by signed in user" do
    visit "/"
    click_link "Sign up"
    fill_in "Email", with: "testemail@fakemail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "This is a message that can be removed"
    click_button "Submit"
    expect(page).to have_content("Delete")
  end
end
