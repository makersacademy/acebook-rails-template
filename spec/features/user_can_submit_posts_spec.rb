require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    signup_and_login
    fill_in "Message", with: "Hello, world!"
    click_button "Create Post"
    expect(page).to have_content("Hello, world!")
  end

  scenario "User can see date and time post was created" do
    signup_and_login
    fill_in "Message", with: "Hello, world 1 !"
    click_button "Create Post"

    expect(page).to have_content(Time.now.to_formatted_s(:long))
  end

  scenario "Editing note" do
    signup_and_login
    fill_in "Message", with: "Hello, world 1 !"
    click_button "Create Post"

    click_link "Edit"
    fill_in "Message", with: "Edited Note"
    click_button "Edit"
   
    expect(page).to have_content("Edited Note")
  end

  scenario "User can delete a post" do
    signup_and_login
    fill_in "Message", with: "Hello, world 1 !"
    click_button "Create Post"
    click_link "Delete"
    expect(page).not_to have_content("Hello, world 1!")
  end

end
