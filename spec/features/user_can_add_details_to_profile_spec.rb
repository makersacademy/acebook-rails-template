require 'rails_helper'

RSpec.feature "User can update their profile", type: :feature do
  scenario "successfully" do
    sign_up_successfully
    click_link 'View profile'
    click_link "Edit profile"
    fill_in "Animal", with: "Capybara"
    click_button 'Save'
    expect(page).to have_content("Type of Animal: Capybara")
  end
end
