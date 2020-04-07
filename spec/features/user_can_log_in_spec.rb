require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can log in" do
    visit "/"
    fill_in "username", with: "stephan"
    fill_in "password", with: "password"
    click_button "Sign In"
    expect(page).to have_content("Hello, world!")
  end
end
