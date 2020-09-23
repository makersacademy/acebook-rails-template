require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

  scenario "Newest post will show first" do
     visit "/posts"
     click_link "New post"
     fill_in "Message", with: "Hello, world 1 !"
     click_button "Submit"

      visit "/posts"
      click_link "New post"
      fill_in "Message", with: "Hello, world 2 !"
      click_button "Submit"
  
    expect(page).to have_content("Hello, world 2 !\n#{Time.now.to_formatted_s(:long)} Edit Delete\nHello, world 1 !")
  end

  scenario "User can see date and time post was created" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world 1 !"
    click_button "Submit"

    expect(page).to have_content(Time.now.to_formatted_s(:long))
  end

  scenario "Editing note" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world 1 !"
    click_button "Submit"

    click_link "Edit"
    fill_in "Message", with: "Edited Note"
    click_button "Edit"
   
    expect(page).to have_content("Edited Note")
  end

  scenario "User can delete a post" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world 1 !"
    click_button "Submit"
    click_link "Delete"
    expect(page).not_to have_content("Hello, world 1!")
  end

end
