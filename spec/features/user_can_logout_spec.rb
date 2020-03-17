require 'rails_helper'

RSpec.feature "Log out", type: :feature do
  scenario "User can log out" do
    visit "/users/new"
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    click_button "Submit"
    click_on "Log out"
    expect(current_path).to eq('/')
  end
end
