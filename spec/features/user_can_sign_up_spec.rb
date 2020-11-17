require 'rails_helper'

RSpec.feature "Sign Up", type: :feature do
  scenario "Can sign up for Acebook" do
    visit "/"
    click_link "Sign Up"
    fill_in "user_username", with: "arakno"
    fill_in "user_full_name", with: "Arabella Knowles"
    fill_in "user_email", with: "arakno@makers.com"
    fill_in "user_password", with: "makers4life"
    click_button "Submit"
    expect(page).to have_content("Homepage")
  end
end