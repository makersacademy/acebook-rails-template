require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

  scenario "Can submit posts and view them" do
     visit "/posts"
     click_link "New post"
     fill_in "Message", with: "Hello, world 1 !"
     click_button "Submit"

      visit "/posts"
      click_link "New post"
      fill_in "Message", with: "Hello, world 2 !"
      click_button "Submit"
  
    expect(page).to have_content("Hello, world 2 !\nHello, world 1 !")
  end

end
