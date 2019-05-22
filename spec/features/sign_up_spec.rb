require 'rails_helper'

RSpec.feature "Sign Up", type: :feature do

  before(:each) do
    visit("/")
  end

  scenario "Can see Sign Up form" do
    expect(page).to have_content("Sign Up")
  end

  scenario "Can fill out Sign Up form" do
    fill_in "Email", with: "test@email.com"
    fill_in "Password", with: "testpassword"
    click_button "Submit"
    expect(page).to have_content("Sign Up Successful!")
  end
end