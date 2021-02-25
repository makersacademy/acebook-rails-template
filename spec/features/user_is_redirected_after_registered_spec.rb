require 'rails_helper'

RSpec.feature "Redirected", type: :feature do
  scenario "to posts route after user registered" do
    visit("/")
    click_link("Register")
    fill_in 'Email', with: 'example@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button("Sign up")
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
end
