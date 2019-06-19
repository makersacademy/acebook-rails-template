require 'rails_helper'

RSpec.feature "Sign up", type: :feature do
  scenario "User can sign up" do
    visit "/"
    fill_in "first-name", with: "Amoeba"
    fill_in "last-name", with: "Boyz"
    fill_in "email", with: "amoeba_boyz@amoeba.gov"
    fill_in "password", with: "1234"
    fill_in "confirm-password", with: "1234"
    click_button "Submit"
    expect(page).to have_content("Hello, Amoeba!")
  end
end
