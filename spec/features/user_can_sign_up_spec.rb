require 'rails_helper'

RSpec.feature "Users", type: :feature do
  scenario "Can sign up" do
    visit "/users/new"
    fill_in "user_username", with: "Bobby"
    fill_in "user_email", with: "123@123.123"
    fill_in "user_password", with: "password"

    click_button "Submit"

    expect(page).to have_content("Bobby")
  end
end
