require 'rails_helper'

RSpec.feature "Signing in", type: :feature do
  scenario "successful sign in" do
    visit('/')
    click_link("Login")
    fill_in(:user_email, with: "user1@test.com")
    fill_in(:user_password, with: "password1")
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'

  end
end
