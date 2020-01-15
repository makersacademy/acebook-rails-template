require 'rails_helper'

RSpec.feature "Sign up", type: :feature do
  scenario "Can create an account" do
    visit "/sign_up"
    fill_in "First name", with: "David"
    fill_in "Surname", with: "Bacall"
    fill_in "Email", with: "dbacall@hotmail.co.uk"
    fill_in "Password", with: "password"
    within ".submit-field" do
      click_on "Sign up"
    end
    expect(page).to have_content("Hello David!")
  end
end
