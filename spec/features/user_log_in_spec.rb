require 'rails_helper'

RSpec.feature "Log In", type: :feature do
  scenario "user can log in" do
    visit "/users/sign_in"
    fill_in "user_email", with: "bob@example.com"
    fill_in "user_password", with: "password1!"
    click_button "Log in"
    expect(current_path).to eq '/'
    expect(page).to have_content("Signed in successfully.")
  end

  scenario "user can't log in if fields are blank" do
    visit "/users/sign_in"
    click_button "Log in"
    expect(current_path).to eq '/users/sign_in'
  end
end