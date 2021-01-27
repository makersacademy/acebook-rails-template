require 'rails_helper'

RSpec.feature "Sign-Up", type: :feature do
  scenario "Can sign up to acebook" do
    visit "/"
    click_link "Sign up please!"
    fill_in "Username", with: "Ian"
    fill_in "Email", with: "ian@acebook.com"
    fill_in "Password", with: "password"
    click_button "Sign Me Up!"
    expect(page).to have_content("Your homepage!")
  end
end