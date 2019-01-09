require "helpers/authentication_helper"
require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  scenario "comment on someone elses post" do
    sign_up_as_ben()
    click_link "My Page"
    fill_in "post_text", with: "Hello this is my first post"
    click_button "submit"
    click_link "Logout"
    visit "/"
    click_link "Sign up"
    fill_in "Firstname", with: "Paul"
    fill_in "Lastname", with: "Kane"
    fill_in "Username", with: "PaulKane12"
    fill_in "Email", with: "paulkane@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    click_link "Home"
    click_link "BenSmith12"
    click_button "Comments"
    fill_in "comment[text]", with: "nice first post"
    click_button "submit"
    expect(page).to have_content("nice first post")
    expect(page).to have_content("Comment by: PaulKane12")
  end
  scenario "comment count goes up" do
    sign_up_as_ben()
    click_link "My Page"
    fill_in "post_text", with: "Hello this is my first post"
    click_button "submit"
    click_link "Logout"
    visit "/"
    click_link "Sign up"
    fill_in "Firstname", with: "Paul"
    fill_in "Lastname", with: "Kane"
    fill_in "Username", with: "PaulKane12"
    fill_in "Email", with: "paulkane@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    click_link "Home"
    click_link "BenSmith12"
    click_button "Comments"
    fill_in "comment[text]", with: "nice first post"
    click_button "submit"
    expect(page).to have_content("Comments (1)")
  end


end
