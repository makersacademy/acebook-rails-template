require 'rails_helper'

RSpec.feature "Signup", type: :feature do
  scenario "Can singup and create a new account" do
    visit "users/new"
    fill_in "user[firstname]", with: "Zizi"
    fill_in "user[surname]", with: "Dweng"
    fill_in "user[email]", with: "zizidwengy@email.com"
    fill_in "user[password]", with: "harryisthebest"
    click_button "Submit"
    expect(page).to have_content("Welcome Zizi!")
  end
end