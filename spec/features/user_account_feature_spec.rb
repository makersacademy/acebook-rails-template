require 'rails_helper'

RSpec.feature "Sign Up", type: :feature do
  scenario "Can sign up" do
    sign_up
    expect(page).to have_content("Welcome Gandalf The Grey")
  end

  scenario "Can sign in" do
    sign_up
    click_on "Logout"
    click_on "Sign In"
    fill_in "Email", with: "gandalf@middleearth.org"
    fill_in "Password", with: "shadowfangs"
    click_on "Log in"
    expect(page).to have_content("Welcome Gandalf The Grey")
  end


end
