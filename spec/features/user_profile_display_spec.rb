require 'rails_helper'

RSpec.feature "Display username", type: :feature do
  scenario "User can see their username" do
    sign_up_and_sign_in
    click_link "Profile"
    expect(page).to have_content('Clint GoldFish Pondsworth')
  end

  scenario "User can click on antoher user's name to see their profile" do
    sign_up_and_sign_in
    click_link "Log Out"
    sign_up_and_sign_in_2
    click_link "Users"
    click_link "Clint Pondsworth"
    expect(page).to have_content('GoldFish')
  end
end
