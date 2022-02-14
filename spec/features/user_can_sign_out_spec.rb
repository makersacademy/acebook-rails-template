require 'rails_helper'

feature 'sign out' do 
  scenario 'signed in users can sign out' do
    visit('/')
    click_link("Sign Up")
    fill_in("user_email", with: "hello@hello.com")
    fill_in("user_password", with: "123456")
    fill_in("user_password_confirmation", with: "123456")
    click_button("Sign up")
    click_link("Sign Out")
    expect(page).to have_content("Signed out successfully.")
  end
end