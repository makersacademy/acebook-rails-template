require 'rails_helper'

RSpec.feature "Sign up", type: :feature do
  scenario "User can sign up" do
    visit "/welcome"
    click_button "Sign Up"
    fill_in "username", with: "JooMin"
    fill_in "password", with: "123"
    click_button "Submit"
    expect(page).to have_content("Hello, JooMin")
  end
end
