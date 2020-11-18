require 'rails_helper'

RSpec.feature "Logout", type: :feature do
  scenario "user can logout once signed in" do
    user_signup('arakno', 'arakno@makers.com', 'Arabella Knowles', 'makers4L')
    click_link "Logout"
    expect(page).to have_content("Successfully signed out")
  end
end