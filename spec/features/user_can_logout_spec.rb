require 'rails_helper'

RSpec.feature "Logout", type: :feature do
  scenario "user can logout once signed in" do
    user_signup('arakno', 'arakno@makers.com')
    click_link "Logout"
    expect(page).to have_content("Successfully signed out")
  end
end