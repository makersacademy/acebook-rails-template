require 'rails_helper'

RSpec.feature "Log in", type: :feature do

  before(:each) do
    visit("/")
  end

  scenario "Can see Log in link" do
    expect(page).to have_content("Login")
  end

  scenario "Can fill out Log in form" do
    click_link "Login"
    fill_in "Email", with: "test@email.com"
    fill_in "Password", with: "testpassword"
    click_button "Submit"
    expect(page).to have_content("What a specimen")
  end
end
