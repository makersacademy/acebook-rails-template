require 'rails_helper'
require 'web_helpers'

RSpec.feature "Student", type: :feature do
  scenario "can sign up" do
    sign_up_mentor
    expect(page).to have_content("All Students")
  end

  scenario "can sign in" do
    sign_up_mentor
    click_link 'Log out'
    sign_in_mentor
    expect(page).to have_content("All Students")
  end

  scenario "can sign out" do
    sign_up_mentor
    click_link "Log out"
    expect(page).to have_content("Signed out successfully.")
  end
end
