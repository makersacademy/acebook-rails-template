require 'rails_helper'
require 'features_helper'

RSpec.feature "Logout", type: :feature do
  scenario "user can logout" do
    signup
    login
    click_button "Logout"
    expect(page).to have_content("Welcome to Dreambook!")
  end
end