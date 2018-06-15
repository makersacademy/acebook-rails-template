require 'rails_helper'

RSpec.feature "Sign out", type: :feature do
  scenario "User can sign out by clicking button" do
    sign_up_and_sign_in
    click_link "Log Out"
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end
