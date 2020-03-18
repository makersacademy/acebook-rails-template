require 'rails_helper'

RSpec.feature "Can see user name by posts", type: :feature do
  scenario "can see name next to post" do
    user_sign_up

    click_link "New post"
    fill_in "Message", with: "Hello"
    click_button "Submit"

    expect(page).to have_content("Hello")
    expect(page).to have_content("testing@test.com")
  end
end