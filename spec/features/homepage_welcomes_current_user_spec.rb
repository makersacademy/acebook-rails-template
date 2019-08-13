require 'rails_helper'

feature "Welcome message" do
  scenario "Home page displays welcome message for current user" do
    signup
    expect(page).to have_content("Welcome Kaja P!")
  end
end
