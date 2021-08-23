require 'rails_helper'

RSpec.feature "Log In", type: :feature do
  scenario "user can log in" do
    user_sign_up
    click_link "Log Out"
    user_log_in
    expect(current_path).to eq '/'
    expect(page).to have_content("Signed in successfully.")
  end

  scenario "user can't log in if fields are blank" do
    visit "/users/sign_in"
    click_button "Log in"
    expect(current_path).to eq '/users/sign_in'
  end
end