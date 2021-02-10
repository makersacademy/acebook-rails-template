require 'rails_helper'

RSpec.feature "Friends System", type: :feature do
  before do
    visit "/"
    within_fieldset :sign_up do
      fill_in "user_username", with: "Lotty"
      fill_in "user_password", with: "Password12"
      click_button "Sign Up"
    end
    within_fieldset :log_in do
      fill_in "username", with: "Lotty"
      fill_in "password", with: "Password12"
      click_button "Log In"
    end
    # create new user and sign in
  end

  scenario "Add friend" do
    visit "/users/1"
    click_on "Send Friend Request"
    expect(page).to have_button("Delete Friend Request")
  end
end

