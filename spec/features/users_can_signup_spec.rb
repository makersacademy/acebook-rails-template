 require 'rails_helper'

RSpec.feature "Signup", type: :feature do
  scenario "sign up page has name, email and password fields" do
    visit '/users/new'
    save_and_open_page
    fill_in 'user_name', with: "Lisa"
    fill_in "user_email", with: "lisa@email.com"
    fill_in "user_password", with: "Password"
    click_button "Sign up"
    expect(page).to have_content("Sign in")
  end
end
