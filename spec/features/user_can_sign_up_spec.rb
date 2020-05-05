require 'rails_helper'

RSpec.feature "Sign-up", type: :feature do
  scenario "Root takes you to the signup page" do
    visit "/"
    expect(page).to have_content("Sign-up")
  end

  xscenario "User can sign up with their name" do
    visit "/"
    fill_in "name", with: "Gina"
    click "sign-up"
    expect(page).to have_content("Welcome Gina!")
  end
end