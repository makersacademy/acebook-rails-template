require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    user_sign_up
    
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

  scenario "Can submit two posts and view them both on the same page" do
    user_sign_up
    
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    
    click_link "New post"
    fill_in "Message", with: "Hello, world again!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("Hello, world again!")

  end
end
