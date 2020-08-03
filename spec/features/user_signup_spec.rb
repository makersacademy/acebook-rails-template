require 'rails_helper'

RSpec.feature "signup", type: :feature do
  scenario "Can signup" do
    visit "/"
    click_button "Sign Up"
    fill_in "user[email]", with: "test@test.com"
    fill_in "user[password]", with: "123456"
    click_button "Save User"
    expect(page).to have_content("Welcome")
  end
end
