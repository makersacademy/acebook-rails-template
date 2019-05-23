require 'rails_helper'

RSpec.feature "Create an account", type: :feature do

  before(:each) do
    visit("/")
  end

  scenario "Can see Create an accound form" do
    expect(page).to have_content("Create an account")
  end

  scenario "Can fill out Create an accound form" do
    fill_in "Email", with: "test@email.com"
    fill_in "Password", with: "testpassword"
    click_button "Create an account"
    expect(page).to have_content("What a specimen")
  end
end