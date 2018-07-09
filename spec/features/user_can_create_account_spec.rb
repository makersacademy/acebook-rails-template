require 'rails_helper'

RSpec.feature "User creates an account", type: :feature do
  scenario 'successfully' do
    visit root_path
    click_link "Sign up"
    fill_in "Email", with: 'millie@gmail.com'
    fill_in "Firstname", with: "Millie"
    fill_in "Lastname", with: "Smith"
    fill_in "Password", with: "Secure123"
    fill_in "Password confirmation", with: "Secure123"
    click_button 'Sign up'
    expect(page).to have_content("Sign Out")
  end
end
