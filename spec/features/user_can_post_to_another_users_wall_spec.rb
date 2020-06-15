require 'rails_helper'

RSpec.feature "Posting to walls", type: :feature do
  scenario "a user can post to another user's wall" do
    signup
    click_link "Sign out"
    signup2
    click_link "Sign out"
    click_link "Sign in"
    fill_in 'Email', with: 'amoeba@boyz.com'
    fill_in 'Password', with: 'amoeba123'
    click_button 'Log in'
    visit "/users/2"
    click_link "Post to Amoeba2's wall"
    fill_in "Content", with: "Congrats on the calves!"
    click_button "Create Post"
    expect(page).to have_content("Congrats on the calves!")
    expect(page).to have_content("Recipient: Amoeba2")
  end
end
