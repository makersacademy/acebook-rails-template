require "rails_helper"

RSpec.feature "User log out", type: :feature do
  scenario "User can log out" do
    user_sign_up

    click_link "Logout"
    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end
end
