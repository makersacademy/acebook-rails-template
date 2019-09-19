require "rails_helper"
require "./spec/helpers/sign_up_helper"

RSpec.feature "Adding friends", type: :feature do
  scenario "Can see a list of users to add as a friend" do
    sign_up
    click_link 'Logout'
    sign_up_other_user
    expect(page).to have_content("Add Friend")
  end

  scenario "Can add a friend" do
    sign_up
    click_link 'Logout'
    sign_up_other_user
    click_link 'Add Friend'
    expect(page).to have_content("Already friends Remove Friend")
    expect(page).not_to have_content("Add Friend")
  end

  scenario "Can remove a friend" do
    sign_up
    click_link 'Logout'
    sign_up_other_user
    click_link 'Add Friend'
    click_link 'Remove Friend'
    expect(page).to have_content("Add Friend")
  end
end