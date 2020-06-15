require 'rails_helper'

RSpec.feature "Log in", type: :feature do
  scenario "User can log in" do
    signup
    click_link "Sign out"
    click_link "Sign in"
    fill_in 'Email', with: 'amoeba@boyz.com'
    fill_in 'Password', with: 'amoeba123'
    click_button 'Log in'
    expect(page).to have_content("Signed in successfully.")
  end
end
