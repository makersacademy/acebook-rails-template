require 'rails_helper'

RSpec.feature "Sign Up", type: :feature do
  scenario "Can sign up" do
    visit "/"
    click_button "Sign Up"
    fill_in "Email", with: "gandolf@middleearth.org"
    fill_in "Password", with: "shadowfangs"
    fill_in "Password confirmation", with: "shadowfangs"
    fill_in "First name", with: "Gandolf"
    fill_in "Surname", with: "The Grey"
    click_button "Sign up"
    expect(page).to have_content("Welcome Gandolf The Grey")
  end
end
