require 'rails_helper'

RSpec.feature "Main page signup", type: :feature do
  scenario "Users can sign up" do
    visit "/"
    click_link "Signup"
    fill_in "name", with: "Mr Sassy"
    fill_in "email", with: "sassy@makers.com"
    fill_in "password", with: "12345"
    click_button "Submit"
    expect(page).to have_content("Signed in as Mr Sassy")
  end
end
