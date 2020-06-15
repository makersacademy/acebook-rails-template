require 'rails_helper'
require_relative '../helpers/web_helpers'

RSpec.feature "Sign up", type: :feature do
  scenario "Can create an account" do
    sign_up
    expect(page).to have_content("Hello David!")
    expect(page).to have_content("David's Wall")
  end

  scenario "Password must be between 6 and 10 characters" do
    visit '/sign_up'
    fill_in "First name", with: "David"
    fill_in "Surname", with: "Bacall"
    fill_in "Email", with: "dbacall@hotmail.co.uk"
    fill_in "Password", with: "passw"
    click_on "Sign up"
    expect(page).to have_content "Password must be 6-10 characters!"
  end

end
