require 'rails_helper'

RSpec.feature "Logout", type: :feature do
  scenario "User can logout" do
    signup_login
    click_button "Logout"
    expect(page).to have_content("Welcome")
  end
end