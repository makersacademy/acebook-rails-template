require 'rails_helper'
require "helpers/authentication_helper"

RSpec.feature "Create posts", type: :feature do
  scenario "Can post on own wall" do
    sign_in_as_user
    click_link "My Page"
    fill_in "text", with: "Hello!!"
    click_button "submit"
    expect(page).to have_content("Hello!!")
  end
  scenario "Can post on others wall" do
    sign_in_as_user
    click_link "My Page"
    fill_in "text", with: "Hello!!"
    click_button "submit"
    expect(page).to have_content("Hello!!")
  end


end
