require 'rails_helper'

feature 'Delete post' do
  scenario 'user can delete a post' do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Delete me!"
    click_button "Submit"
    click_link 'Delete post'
    expect(page).to_not have_content("Delete me!")
  end
end