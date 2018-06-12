require 'rails_helper'

RSpec.feature "Display username", type: :feature do
  scenario "User can see their username" do
    sign_up_and_sign_in
    click_link "Profile"
    expect(page).to have_content('Clint Pondsworth')
  end
end
