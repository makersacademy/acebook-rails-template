require 'rails_helper'

RSpec.feature "Sign up", type: :feature do
  scenario "shows sign-up page with email/password prompt" do
    visit "/users/sign_up"
    expect(page).to have_selector("#user_email")
    expect(page).to have_selector("#user_password")
    expect(page).to have_selector("#user_password_confirmation")
  end
end
