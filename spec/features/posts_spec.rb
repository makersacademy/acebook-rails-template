require 'rails_helper'
require_relative 'web_helpers'

RSpec.feature "Acebook", type: :feature do
  scenario "Can view a post" do
    visit_home_create_post
  end

  scenario "Can delete a post" do
    visit_home_create_post
    click_link "Delete"
    expect(page).to_not have_content("Hello, world!")
  end

  scenario "Can edit a post" do
    visit_home_create_post
    click_link "Edit"
    fill_in "Message", with: "Hello, world!!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!!")
  end
end