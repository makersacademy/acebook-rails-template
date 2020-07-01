require 'rails_helper'

RSpec.feature "Sign Up", type: :feature do
  scenario "User can sign up to acebook" do
    visit "/"
    expect(page).to have_content("Sign Up")
  end

  scenario "User can sign up with a name" do
      visit "/"
      fill_in "user[name]", with: "Emanuele"
      click_on "Sign up"
      expect(page).to have_content("Emanuele")
    end
  end
