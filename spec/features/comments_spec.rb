require 'rails_helper'
require_relative 'web_helpers/users_helper'

RSpec.feature "Acebook", type: :feature do
  scenario "Can add a comment to a post" do
    signup_login
    visit_home_create_post
    fill_in "comment[body]", with: "Here is a comment"
    click_button "Create Comment"
    expect(page).to have_content("Here is a comment")
  end

  scenario "Can delete a comment from a post" do
    signup_login
    visit_home_create_post
    fill_in "comment[body]", with: "Here is a comment"
    click_button "Create Comment"
    expect(page).to have_content("Here is a comment")
    click_link "Delete Comment"
    expect(page).to_not have_content("Here is a comment")
  end

end