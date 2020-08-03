require 'rails_helper'

RSpec.feature "signup", type: :feature do
  scenario "Can signup" do
    visit "/"
    click_button "Sign up"
    fill_in "Email", with: "test@test.com"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
end
