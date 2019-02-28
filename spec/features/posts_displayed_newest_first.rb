require 'rails_helper'

RSpec.feature "Display Posts", type: :feature do
  scenario "Can view posts arranged newest first" do
    visit "/"
    fill_in "Email", with: "bob@bob.com"
    fill_in "Password", with: "bbbbbbb"
    click_button "Log in"
    expect(page).to have_content("Hello, world!")
  end
end
