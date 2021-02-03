require 'rails_helper'

RSpec.feature "Register account", type: :feature do
  scenario "user can sign up" do
    visit "/users"
    click_link "sign up page"
    fill_in "user_username", with: "Lotty"
    fill_in "user_password_digest", with: "Password12"
    click_button "Submit"
    expect(page).to have_content("You have signed up")
  end


# scenario "invalid login" do
#     visit "/user"
#     click_link "Login "
#     fill_in "username", with: "Lotty"
#     fill_in "password_digest", with: "Password12"
#     click_button "Submit"
#     expect(page).to have_content("You have Logged in")
#   end

end