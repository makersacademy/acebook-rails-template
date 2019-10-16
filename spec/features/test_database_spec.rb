require 'rails_helper'
require 'spec_helper'

RSpec.feature "Database", type: :feature do
  scenario "Test Database" do
    visit signup_path
    # p ("signup path = #{signup_path}")
    fill_in "First Name", with: "Superman"
    fill_in "Last Name", with:" Kent"
    fill_in "Email", with: "1@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Confirm Password", with: "password"
    click_button "Sign Up"
    visit('/login')
    expect(page).to have_content("Join Now")
  end
end