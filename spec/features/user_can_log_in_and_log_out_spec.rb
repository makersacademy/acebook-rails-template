require 'rails_helper'

RSpec.feature "Log out", type: :feature do
  scenario "User can log out" do
    sign_up_and_login
    click_link "Log out"
    expect(page).to have_content "Log in"
  end
end
