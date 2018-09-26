require 'rails_helper'

RSpec.feature "New Users", type: :feature do
  scenario "user sign up" do
    visit "/users/sign_up"
    fill_in :user_name, with: "Bob"
    fill_in :user_email, with: "Bob@bob.com"
    fill_in :user_password, with: "123456"
    fill_in :user_password_confirmation, with: "123456"
    click_button "Sign up"
    expect(page).to have_content("acebook")
  end
end
