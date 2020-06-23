require 'rails_helper'
require 'web_helpers'

RSpec.feature "Users", type: :feature do
  scenario "can sign up" do
    sign_up
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario "can sign in" do
    sign_up
    click_link 'Sign Out'
    sign_in
    expect(page).to have_content("Signed in successfully.")
  end

  scenario "can sign out" do
    sign_up
    click_link "Sign Out"
    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end
end
