require 'rails_helper'

RSpec.feature 'User Sign out', type: :feature do
  scenario 'Can sign out of SCZL' do
    register
    click_link 'Sign Out'
    expect(page).to have_content('Signed out successfully')
  end

  scenario "can't see sign out button if not signed in" do
    visit('/')
    expect(page).not_to have_content('Sign Out')
  end
end
