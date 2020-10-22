require 'rails_helper'

feature "delete post" do 
  scenario "User can delete post" do 
    sign_up 
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link "delete"
    expect(page).not_to have_content("Hello, world!")
  end
end