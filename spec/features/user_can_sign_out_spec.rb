require 'rails_helper'

RSpec.feature "Sign out", type: :feature do
  scenario "User can sign oout" do
    signup
    click_link "Sign out"
    expect(page).to have_content("Signed out successfully.")
  end
end
