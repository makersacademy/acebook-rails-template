require 'rails_helper'
require 'sign_up_helper'
require 'post_hi_earth_helper'

RSpec.feature "Like comments", type: :feature do

  scenario "User like another user's comment" do
    sign_up
    post_hi_earth
    click_link "Comment"
    click_link "Show Comments"
    click_link "New Comment"








    find_button("Edit").click

    expect(page).to have_content("Hi, earth!")

    fill_in "post[message]", with: "Goodbye, planet!"
    click_button "Submit"

    expect(page).to have_current_path('/posts')
    expect(page).not_to have_content("Hi, earth!")
    expect(page).to have_content("Goodbye, planet!")
  end
