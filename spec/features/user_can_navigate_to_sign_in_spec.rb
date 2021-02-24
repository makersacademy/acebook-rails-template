require 'rails_helper'

RSpec.feature "Signing in", type: :feature do
  scenario "You can press the button and go sign in" do
    visit("/")
    click_link("Sign in")
    expect(page).to have_content("Log in")
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
  end
end
