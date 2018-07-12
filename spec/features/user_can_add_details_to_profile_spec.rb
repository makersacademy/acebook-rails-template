# frozen_string_literal: true

require 'rails_helper'

RSpec.feature "User can update their profile", type: :feature do
  scenario "successfully" do
    sign_up_successfully

    click_link 'View profile'
    click_link "Edit profile"
    fill_in "Animal", with: "Capybara"
    fill_in "Age", with: "10"
    fill_in "Owner", with: "Wallace"
    click_button 'Save'
    expect(page).to have_content("Type of Animal: Capybara")
    expect(page).to have_content("Age: 10")
    expect(page).to have_content("Owner: Wallace")
  end
end
