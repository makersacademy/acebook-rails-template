require 'rails_helper'

RSpec.feature "Sign-up", type: :feature do
  scenario "Root takes you to the signup page" do
    visit "/"
    expect(page).to have_content("Sign-up")
  end

  scenario "User can sign up with their name" do
    visit "/"
    fill_in "user[name]", with: "Gina"
    click_on "Sign up"
    expect(page).to have_content("Welcome Gina!")
  end
end